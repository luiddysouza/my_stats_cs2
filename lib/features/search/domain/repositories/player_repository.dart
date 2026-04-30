import 'package:fpdart/fpdart.dart';
import 'package:my_stats_cs2/core/errors/failures.dart';
import 'package:my_stats_cs2/features/search/domain/entities/player_entity.dart';

abstract interface class PlayerRepository {
  Future<Either<AppFailure, PlayerEntity>> findPlayer(String input);
}
