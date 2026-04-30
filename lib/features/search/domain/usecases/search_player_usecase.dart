import 'package:fpdart/fpdart.dart';
import 'package:my_stats_cs2/core/errors/failures.dart';
import 'package:my_stats_cs2/features/search/domain/entities/player_entity.dart';
import 'package:my_stats_cs2/features/search/domain/repositories/player_repository.dart';

class SearchPlayerUseCase {
  const SearchPlayerUseCase(this._repository);

  final PlayerRepository _repository;

  static final _steamIdRegex = RegExp(r'^765\d{14}$');
  static final _profileUrlRegex = RegExp(
    r'steamcommunity\.com/profiles/(\d{17})',
  );
  static final _customUrlRegex = RegExp(r'steamcommunity\.com/id/([^/\s]+)');

  Future<Either<AppFailure, PlayerEntity>> call(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) {
      return Future.value(
        Left(
          InvalidInputFailure(message: 'Informe um Steam ID ou URL do perfil.'),
        ),
      );
    }
    final isSteamId = _steamIdRegex.hasMatch(trimmed);
    final isProfileUrl = _profileUrlRegex.hasMatch(trimmed);
    final isCustomUrl = _customUrlRegex.hasMatch(trimmed);

    if (!isSteamId && !isProfileUrl && !isCustomUrl) {
      return Future.value(
        Left(
          InvalidInputFailure(
            message:
                'Entrada inválida. Use um Steam ID ou URL do perfil Steam.',
          ),
        ),
      );
    }
    return _repository.findPlayer(trimmed);
  }
}
