import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_demo/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("integration test", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle();

    expect(find.text('go to demo screen'), findsOneWidget);
    await tester.tap(find.byKey(Key('GoToDemo')));
    await tester.pumpAndSettle();
    expect(find.text('demo screen'), findsOneWidget);
    await tester.tap(find.byKey(Key('GoToMain')));
    await tester.pumpAndSettle();
    expect(find.text('go to demo screen'), findsOneWidget);
  });
}
