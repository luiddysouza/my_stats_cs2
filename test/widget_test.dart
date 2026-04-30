import 'package:flutter_test/flutter_test.dart';
import 'package:my_stats_cs2/app.dart';

void main() {
  testWidgets('App renders without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(App), findsOneWidget);
  });
}
