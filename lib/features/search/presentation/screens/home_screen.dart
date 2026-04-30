import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_stats_cs2/core/constants/app_colors.dart';
import 'package:my_stats_cs2/features/search/presentation/providers/search_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchNotifierProvider);

    ref.listen<SearchState>(searchNotifierProvider, (_, next) {
      if (next.player != null) {
        context.go(
          '/matches',
          extra: {
            'steamId': next.player!.steamId,
            'displayName': next.player!.displayName,
          },
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              const Text(
                'MyStats CS2',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Suas estatísticas de Counter-Strike 2',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 48),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Steam ID ou URL do perfil',
                  hintText: 'ex: 76561198012345678',
                  prefixIcon: const Icon(Icons.search),
                  errorText: searchState.errorMessage,
                  border: const OutlineInputBorder(),
                ),
                onSubmitted: (_) => _onSearch(),
              ),
              const SizedBox(height: 16),
              if (searchState.isLoading)
                const Center(child: CircularProgressIndicator())
              else
                FilledButton(onPressed: _onSearch, child: const Text('Buscar')),
            ],
          ),
        ),
      ),
    );
  }

  void _onSearch() {
    ref.read(searchNotifierProvider.notifier).search(_controller.text);
  }
}
