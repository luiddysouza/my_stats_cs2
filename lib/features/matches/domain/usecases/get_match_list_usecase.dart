import 'package:fpdart/fpdart.dart';
import 'package:my_stats_cs2/core/errors/failures.dart';
import 'package:my_stats_cs2/features/matches/domain/entities/match_entity.dart';
import 'package:my_stats_cs2/features/matches/domain/repositories/match_repository.dart';

class GetMatchListUseCase {
  const GetMatchListUseCase(this._repository);

  final MatchRepository _repository;

  Future<Either<AppFailure, List<MatchEntity>>> call(String steamId) {
    return _repository.getMatches(steamId);
  }
}
