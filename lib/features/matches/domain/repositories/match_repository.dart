import 'package:fpdart/fpdart.dart';
import 'package:my_stats_cs2/core/errors/failures.dart';
import 'package:my_stats_cs2/features/matches/domain/entities/match_entity.dart';

abstract interface class MatchRepository {
  Future<Either<AppFailure, List<MatchEntity>>> getMatches(String steamId);
}
