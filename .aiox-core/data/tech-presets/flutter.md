# Flutter Tech Preset

> Preset de arquitetura otimizado para desenvolvimento mobile-only com Flutter e Dart, focado em clean architecture e máxima eficiência com AIOX agents.

---

## Metadata

```yaml
preset:
  id: flutter
  name: 'Flutter Mobile Preset'
  version: 1.0.0
  description: 'Arquitetura otimizada para apps mobile-only com Flutter, Dart, Riverpod e Clean Architecture'
  technologies:
    - Flutter 3.x (stable channel)
    - Dart 3.x
    - Riverpod (state management)
    - go_router (navigation)
    - Freezed (immutable models)
    - Dio (HTTP client)
    - Hive / shared_preferences (local storage)
    - flutter_test + mocktail (testing)
  suitable_for:
    - 'Aplicações mobile iOS e Android'
    - 'Apps com UI complexa e alta performance'
    - 'Projetos mobile-first sem backend próprio'
    - 'MVPs mobile com integração a APIs externas'
  not_suitable_for:
    - 'Aplicações web SPA (use Next.js preset)'
    - 'Backend APIs (use Go ou Node.js preset)'
    - 'Apps com lógica de servidor pesada'
```

---

## Design Patterns (The Essential 4)

> Estes 4 patterns formam a espinha dorsal de um app Flutter escalável. Use TODOS juntos.

### Pattern 1: Feature-First Clean Architecture

**Purpose:** Separar responsabilidades em camadas (data → domain → presentation) por feature

**Execution Score:** 10/10 | **Anti-Bug Score:** 10/10

```
lib/
  features/
    auth/
      data/
        datasources/   # API calls, local DB
        models/        # JSON serializable models (Freezed)
        repositories/  # implements domain contract
      domain/
        entities/      # pure Dart classes, no Flutter deps
        repositories/  # abstract contracts
        usecases/      # single-responsibility business logic
      presentation/
        providers/     # Riverpod providers
        screens/       # UI screens
        widgets/       # screen-specific widgets
```

**Bugs Eliminated:**

- [ ] UI code calling APIs directly
- [ ] Business logic scattered in widgets
- [ ] Impossible to unit test without launching the app
- [ ] Changing API breaks UI code directly

**Why It Works:**

- Each layer depends only on the layer below via abstract contracts
- Domain layer is pure Dart — zero Flutter dependencies, 100% testable
- Riverpod providers connect domain to UI cleanly

---

### Pattern 2: Repository Contract Pattern

**Purpose:** Define the public interface between data and domain layers

**Execution Score:** 10/10 | **Anti-Bug Score:** 9/10

```dart
// lib/features/auth/domain/repositories/auth_repository.dart

abstract class AuthRepository {
  /// Authenticates user with email and password.
  /// Throws [AuthFailure] on invalid credentials.
  Future<Either<AuthFailure, UserEntity>> login(String email, String password);

  /// Returns the currently authenticated user or null.
  Future<UserEntity?> getCurrentUser();

  /// Signs out the current user.
  Future<void> logout();
}
```

```dart
// lib/features/auth/data/repositories/auth_repository_impl.dart

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;

  const AuthRepositoryImpl(this._remote, this._local);

  @override
  Future<Either<AuthFailure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final model = await _remote.login(email: email, password: password);
      await _local.cacheUser(model);
      return Right(model.toEntity());
    } on UnauthorizedException {
      return Left(AuthFailure.invalidCredentials());
    } on NetworkException {
      return Left(AuthFailure.networkError());
    }
  }
}
```

**Bugs Eliminated:**

- [ ] Data source changed breaks UI directly
- [ ] Impossible to mock network calls in tests
- [ ] Mixed concerns between API models and domain entities

---

### Pattern 3: UseCase Pattern

**Purpose:** Encapsulate a single business operation; the only thing a Provider calls

**Execution Score:** 9/10 | **Anti-Bug Score:** 9/10

```dart
// lib/features/auth/domain/usecases/login_usecase.dart

class LoginUseCase {
  final AuthRepository _repository;

  const LoginUseCase(this._repository);

  Future<Either<AuthFailure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return _repository.login(email, password);
  }
}
```

```dart
// Riverpod provider wiring
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});
```

**Bugs Eliminated:**

- [ ] Business logic duplicated across multiple screens
- [ ] Providers growing into 500-line files
- [ ] Impossible to reuse logic in different screens

---

### Pattern 4: Riverpod AsyncNotifier for UI State

**Purpose:** Manage screen state reactively without manual setState or StreamControllers

**Execution Score:** 10/10 | **Anti-Bug Score:** 10/10

```dart
// lib/features/auth/presentation/providers/auth_provider.dart

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<UserEntity?> build() async {
    return ref.watch(getCurrentUserUseCaseProvider).call();
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    final result = await ref
        .read(loginUseCaseProvider)
        .call(email: email, password: password);

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (user) => AsyncData(user),
    );
  }

  Future<void> logout() async {
    await ref.read(logoutUseCaseProvider).call();
    state = const AsyncData(null);
  }
}
```

```dart
// Usage in a screen widget
class LoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return authState.when(
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => ErrorWidget(e.toString()),
      data: (user) => user != null ? HomeScreen() : LoginForm(),
    );
  }
}
```

**Bugs Eliminated:**

- [ ] Forgetting to call setState
- [ ] Loading state not shown during async ops
- [ ] Error state not handled
- [ ] Memory leaks from manual StreamControllers

---

## Project Structure

```
my_flutter_app/
  lib/
    core/
      constants/        # app-wide constants (colors, sizes, strings)
      errors/           # failure classes (AuthFailure, NetworkFailure...)
      network/          # Dio client setup, interceptors
      router/           # go_router configuration
      theme/            # ThemeData, text styles
      utils/            # helpers, extensions
    features/
      auth/             # example feature (see patterns above)
        data/
        domain/
        presentation/
      home/
        data/
        domain/
        presentation/
    shared/
      widgets/          # reusable widgets across features
      providers/        # global providers (connectivity, locale...)
    main.dart
    app.dart            # MaterialApp / ProviderScope root
  test/
    features/
      auth/
        data/
        domain/
        presentation/
    helpers/            # test utilities, mocks
  assets/
    images/
    icons/
    fonts/
  pubspec.yaml
```

### Structure Rationale

- **`core/`:** Zero-feature infrastructure shared by everything
- **`features/`:** Vertical slices — each feature owns its full stack (data → UI)
- **`shared/widgets/`:** Generic UI components with no business logic
- **`test/`:** Mirrors `lib/` structure exactly for easy navigation

---

## Tech Stack

| Category        | Technology               | Version  | Purpose                        |
| --------------- | ------------------------ | -------- | ------------------------------ |
| Framework       | Flutter                  | ^3.19.0  | UI framework                   |
| Language        | Dart                     | ^3.3.0   | Programming language           |
| State Mgmt      | flutter_riverpod         | ^2.5.0   | Reactive state management      |
| State Codegen   | riverpod_annotation      | ^2.3.5   | @riverpod code generation      |
| Navigation      | go_router                | ^14.0.0  | Declarative routing            |
| Models          | freezed                  | ^2.5.2   | Immutable data classes         |
| JSON            | json_serializable        | ^6.8.0   | JSON serialization codegen     |
| HTTP            | dio                      | ^5.4.3   | HTTP client with interceptors  |
| Local Storage   | shared_preferences       | ^2.2.3   | Key-value storage              |
| Functional      | fpdart                   | ^1.1.0   | Either / Option types          |
| Testing         | flutter_test (built-in)  | SDK      | Widget & unit tests            |
| Mocking         | mocktail                 | ^1.0.3   | Null-safe mocking              |

### Required Dependencies (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.5.0
  riverpod_annotation: ^2.3.5
  go_router: ^14.0.0
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0
  dio: ^5.4.3
  shared_preferences: ^2.2.3
  fpdart: ^1.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.9
  freezed: ^2.5.2
  json_serializable: ^6.8.0
  riverpod_generator: ^2.4.0
  mocktail: ^1.0.3
  flutter_lints: ^4.0.0
```

---

## Coding Standards

### Naming Conventions

| Element          | Convention      | Example                        |
| ---------------- | --------------- | ------------------------------ |
| Files            | snake_case      | `auth_repository_impl.dart`    |
| Classes          | PascalCase      | `AuthRepositoryImpl`           |
| Variables/params | camelCase       | `final currentUser`            |
| Constants        | camelCase       | `const primaryColor`           |
| Private fields   | _camelCase      | `final _repository`            |
| Providers        | camelCaseProvider | `authNotifierProvider`       |

### Dart Rules

```dart
// GOOD — const constructors wherever possible
const Text('Hello', style: TextStyle(fontSize: 16));

// GOOD — named parameters for clarity
LoginUseCase(email: email, password: password);

// GOOD — Either for error handling, never throw from domain
Future<Either<Failure, T>> call();

// BAD — avoid dynamic
dynamic result = await apiCall(); // ❌

// BAD — avoid BuildContext across async gaps without mounted check
await someAsyncOp();
if (!context.mounted) return; // ✅ always check after await
```

### Widget Rules

- Prefer `ConsumerWidget` over `StatefulWidget` + setState
- Split large build methods into private `_buildXxx()` methods or extracted widgets
- Never put business logic directly in `build()` — delegate to providers
- Use `const` constructors on all leaf widgets

---

## Quality Gates

### Before every commit

```bash
flutter analyze          # no errors, no warnings
flutter test             # all tests pass
dart format . --set-exit-if-changed   # formatting check
```

### Code generation (run after model changes)

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Common Gotchas

- **`context.mounted`** — Always check after any `await` before using `context`
- **`ref.watch` vs `ref.read`** — Use `watch` inside `build`, `read` inside callbacks
- **Freezed codegen** — Run `build_runner` after any `@freezed` change
- **go_router redirect loops** — Always guard redirects with a null/loading check on auth state
- **Riverpod `autoDispose`** — Default in `@riverpod`; use `keepAlive: true` only when needed
