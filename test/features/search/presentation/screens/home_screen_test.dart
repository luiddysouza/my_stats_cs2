import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_stats_cs2/features/search/presentation/screens/home_screen.dart';

Widget _buildTestApp() {
  return const ProviderScope(child: MaterialApp(home: HomeScreen()));
}

void main() {
  testWidgets('renderiza campo de busca e botão', (tester) async {
    await tester.pumpWidget(_buildTestApp());

    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(FilledButton), findsOneWidget);
    expect(find.text('Buscar'), findsOneWidget);
  });

  testWidgets('exibe erro ao submeter campo vazio', (tester) async {
    await tester.pumpWidget(_buildTestApp());

    await tester.tap(find.byType(FilledButton));
    await tester.pumpAndSettle();

    expect(find.textContaining('Informe'), findsOneWidget);
  });
}
