import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_stats_cs2/core/constants/enums.dart';

part 'match_entity.freezed.dart';

@freezed
class MatchEntity with _$MatchEntity {
  const factory MatchEntity({
    required String matchId,
    required String map,
    required DateTime date,
    required int durationMinutes,
    required MatchResult result,
  }) = _MatchEntity;
}
