import 'package:flutter_test/flutter_test.dart';
import 'package:my_stats_cs2/features/matches/data/repositories/mock_match_repository.dart';
import 'package:my_stats_cs2/features/matches/domain/entities/match_entity.dart';
import 'package:my_stats_cs2/features/matches/domain/usecases/get_match_list_usecase.dart';

void main() {
  late GetMatchListUseCase useCase;

  setUp(() {
    useCase = GetMatchListUseCase(MockMatchRepository());
  });

  test('retorna lista de 10 partidas para steamId válido', () async {
    final result = await useCase('76561198012345678');
    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('Expected Right'),
      (matches) => expect(matches.length, equals(10)),
    );
  });

  test('retorna lista do tipo List<MatchEntity>', () async {
    final result = await useCase('76561198012345678');
    result.fold(
      (_) => fail('Expected Right'),
      (matches) => expect(matches, isA<List<MatchEntity>>()),
    );
  });
}
