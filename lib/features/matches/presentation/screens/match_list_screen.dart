import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_stats_cs2/features/matches/presentation/providers/match_list_provider.dart';
import 'package:my_stats_cs2/features/matches/presentation/widgets/match_card.dart';

class MatchListScreen extends ConsumerStatefulWidget {
  const MatchListScreen({super.key, required this.steamId, this.displayName});

  final String steamId;
  final String? displayName;

  @override
  ConsumerState<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends ConsumerState<MatchListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(matchListNotifierProvider.notifier).load(widget.steamId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final matchesAsync = ref.watch(matchListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.displayName != null
              ? 'Partidas de ${widget.displayName}'
              : 'Partidas Recentes',
        ),
      ),
      body: matchesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 12),
              const Text('Erro ao carregar partidas.'),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => ref
                    .read(matchListNotifierProvider.notifier)
                    .load(widget.steamId),
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
        data: (matches) {
          if (matches.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.sports_esports_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Nenhuma partida encontrada.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final match = matches[index];
              final stats = findStatsForMatch(match.matchId);
              if (stats == null) return const SizedBox.shrink();
              return MatchCard(match: match, stats: stats);
            },
          );
        },
      ),
    );
  }
}
