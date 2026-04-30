import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_stats_cs2/features/matches/domain/entities/match_entity.dart';
import 'package:my_stats_cs2/features/matches/presentation/providers/match_list_provider.dart';
import 'package:my_stats_cs2/features/matches/presentation/screens/match_list_screen.dart';

void main() {
  testWidgets('exibe estado vazio quando lista de partidas é vazia', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          matchListNotifierProvider.overrideWith(
            () => _EmptyMatchListNotifier(),
          ),
        ],
        child: const MaterialApp(
          home: MatchListScreen(steamId: '76561198012345678'),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Nenhuma partida encontrada.'), findsOneWidget);
  });
}

class _EmptyMatchListNotifier extends MatchListNotifier {
  @override
  Future<List<MatchEntity>> build() async => [];

  @override
  Future<void> load(String steamId) async {
    state = const AsyncData([]);
  }
}
