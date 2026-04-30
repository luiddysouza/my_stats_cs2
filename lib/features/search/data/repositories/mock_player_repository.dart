import 'package:fpdart/fpdart.dart';
import 'package:my_stats_cs2/core/errors/failures.dart';
import 'package:my_stats_cs2/core/mocks/mock_data.dart';
import 'package:my_stats_cs2/features/search/domain/entities/player_entity.dart';
import 'package:my_stats_cs2/features/search/domain/repositories/player_repository.dart';

class MockPlayerRepository implements PlayerRepository {
  static final _steamIdRegex = RegExp(r'^765\d{14}$');
  static final _profileUrlRegex = RegExp(
    r'steamcommunity\.com/profiles/(\d{17})',
  );
  static final _customUrlRegex = RegExp(r'steamcommunity\.com/id/([^/\s]+)');

  @override
  Future<Either<AppFailure, PlayerEntity>> findPlayer(String input) async {
    final player = MockData.searchedPlayer;

    if (_steamIdRegex.hasMatch(input)) {
      if (input == player.steamId) return Right(player);
      return const Left(PlayerNotFoundFailure());
    }

    final profileMatch = _profileUrlRegex.firstMatch(input);
    if (profileMatch != null) {
      final extractedId = profileMatch.group(1);
      if (extractedId == player.steamId) return Right(player);
      return const Left(PlayerNotFoundFailure());
    }

    final customMatch = _customUrlRegex.firstMatch(input);
    if (customMatch != null) {
      final slug = customMatch.group(1);
      final playerCustomSlug = player.customUrl != null
          ? _customUrlRegex.firstMatch(player.customUrl!)?.group(1)
          : null;
      if (slug != null && slug == playerCustomSlug) return Right(player);
      return const Left(PlayerNotFoundFailure());
    }

    return const Left(PlayerNotFoundFailure());
  }
}
