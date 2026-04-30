import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_stats_cs2/features/matches/data/repositories/mock_match_repository.dart';
import 'package:my_stats_cs2/features/matches/domain/entities/match_entity.dart';
import 'package:my_stats_cs2/features/matches/domain/usecases/get_match_list_usecase.dart';

class MatchListNotifier extends AsyncNotifier<List<MatchEntity>> {
  late final GetMatchListUseCase _useCase;

  @override
  Future<List<MatchEntity>> build() async {
    _useCase = GetMatchListUseCase(MockMatchRepository());
    return [];
  }

  Future<void> load(String steamId) async {
    state = const AsyncLoading();
    final result = await _useCase(steamId);
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (matches) => AsyncData(matches),
    );
  }
}

final matchListNotifierProvider =
    AsyncNotifierProvider<MatchListNotifier, List<MatchEntity>>(
      MatchListNotifier.new,
    );
