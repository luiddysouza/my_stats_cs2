import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_stats_cs2/features/search/domain/entities/player_entity.dart';

part 'player_match_stats_entity.freezed.dart';

@freezed
class PlayerMatchStatsEntity with _$PlayerMatchStatsEntity {
  const factory PlayerMatchStatsEntity({
    required PlayerEntity player,
    required int kills,
    required int assists,
    required int deaths,
    required double rating,
    required int headshots,
    required int mvpCount,
    required int score,
    required String team,
  }) = _PlayerMatchStatsEntity;
}
