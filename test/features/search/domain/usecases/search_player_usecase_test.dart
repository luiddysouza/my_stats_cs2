import 'package:flutter_test/flutter_test.dart';
import 'package:my_stats_cs2/core/errors/failures.dart';
import 'package:my_stats_cs2/features/search/data/repositories/mock_player_repository.dart';
import 'package:my_stats_cs2/features/search/domain/usecases/search_player_usecase.dart';

void main() {
  late SearchPlayerUseCase useCase;

  setUp(() {
    useCase = SearchPlayerUseCase(MockPlayerRepository());
  });

  test('retorna PlayerEntity para SteamID válido', () async {
    final result = await useCase('76561198012345678');
    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('Expected Right'),
      (player) => expect(player.steamId, equals('76561198012345678')),
    );
  });

  test('retorna PlayerEntity para URL de perfil válida', () async {
    final result = await useCase(
      'https://steamcommunity.com/profiles/76561198012345678',
    );
    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('Expected Right'),
      (player) => expect(player.steamId, equals('76561198012345678')),
    );
  });

  test('retorna PlayerEntity para URL customizada válida', () async {
    final result = await useCase('https://steamcommunity.com/id/player_one');
    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('Expected Right'),
      (player) => expect(player.displayName, equals('Player One')),
    );
  });

  test('retorna InvalidInputFailure para texto aleatório', () async {
    final result = await useCase('nao_e_um_steam_id');
    expect(result.isLeft(), isTrue);
    result.fold(
      (failure) => expect(failure, isA<InvalidInputFailure>()),
      (_) => fail('Expected Left'),
    );
  });

  test('retorna InvalidInputFailure para string vazia', () async {
    final result = await useCase('');
    expect(result.isLeft(), isTrue);
    result.fold(
      (failure) => expect(failure, isA<InvalidInputFailure>()),
      (_) => fail('Expected Left'),
    );
  });
}
