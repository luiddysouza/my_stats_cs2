import 'package:fpdart/fpdart.dart';
import 'package:my_stats_cs2/core/errors/failures.dart';
import 'package:my_stats_cs2/core/mocks/mock_data.dart';
import 'package:my_stats_cs2/features/matches/domain/entities/match_entity.dart';
import 'package:my_stats_cs2/features/matches/domain/repositories/match_repository.dart';

class MockMatchRepository implements MatchRepository {
  @override
  Future<Either<AppFailure, List<MatchEntity>>> getMatches(
    String steamId,
  ) async {
    return Right(MockData.matches);
  }
}
