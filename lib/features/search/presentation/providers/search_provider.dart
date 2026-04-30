import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_stats_cs2/core/errors/failures.dart';
import 'package:my_stats_cs2/features/search/data/repositories/mock_player_repository.dart';
import 'package:my_stats_cs2/features/search/domain/entities/player_entity.dart';
import 'package:my_stats_cs2/features/search/domain/usecases/search_player_usecase.dart';

class SearchState {
  const SearchState({this.isLoading = false, this.player, this.errorMessage});

  final bool isLoading;
  final PlayerEntity? player;
  final String? errorMessage;
}

class SearchNotifier extends Notifier<SearchState> {
  late final SearchPlayerUseCase _useCase;

  @override
  SearchState build() {
    _useCase = SearchPlayerUseCase(MockPlayerRepository());
    return const SearchState();
  }

  Future<void> search(String input) async {
    state = const SearchState(isLoading: true);
    final result = await _useCase(input);
    result.fold(
      (failure) {
        state = SearchState(errorMessage: _failureMessage(failure));
      },
      (player) {
        state = SearchState(player: player);
      },
    );
  }

  String _failureMessage(AppFailure failure) => switch (failure) {
    InvalidInputFailure(:final message) => message,
    PlayerNotFoundFailure() => 'Jogador não encontrado.',
    UnexpectedFailure(:final message) => message,
  };
}

final searchNotifierProvider = NotifierProvider<SearchNotifier, SearchState>(
  SearchNotifier.new,
);
