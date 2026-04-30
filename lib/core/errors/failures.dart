sealed class AppFailure {
  const AppFailure();
}

final class InvalidInputFailure extends AppFailure {
  const InvalidInputFailure({required this.message});
  final String message;
}

final class PlayerNotFoundFailure extends AppFailure {
  const PlayerNotFoundFailure();
}

final class UnexpectedFailure extends AppFailure {
  const UnexpectedFailure({required this.message});
  final String message;
}
