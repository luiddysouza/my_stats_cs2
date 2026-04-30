import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_stats_cs2/core/constants/app_colors.dart';
import 'package:my_stats_cs2/core/constants/enums.dart';
import 'package:my_stats_cs2/core/mocks/mock_data.dart';
import 'package:my_stats_cs2/features/matches/domain/entities/match_entity.dart';
import 'package:my_stats_cs2/features/matches/domain/entities/player_match_stats_entity.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.match, required this.stats});

  final MatchEntity match;
  final PlayerMatchStatsEntity stats;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.push('/matches/${match.matchId}'),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _ResultBadge(result: match.result),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      match.map,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    _formatDate(match.date),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'K: ${stats.kills}  A: ${stats.assists}  D: ${stats.deaths}  Rating: ${stats.rating.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}';
  }
}

class _ResultBadge extends StatelessWidget {
  const _ResultBadge({required this.result});

  final MatchResult result;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (result) {
      MatchResult.win => ('W', AppColors.win),
      MatchResult.loss => ('L', AppColors.loss),
      MatchResult.draw => ('D', AppColors.draw),
    };
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}

/// Helper to find stats for a given matchId from MockData.
PlayerMatchStatsEntity? findStatsForMatch(String matchId) {
  try {
    return MockData.matchStats.firstWhere((s) => s.matchId == matchId);
  } catch (_) {
    return null;
  }
}
