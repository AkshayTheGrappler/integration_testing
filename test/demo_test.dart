import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_demo/demo.dart';

void main() {
  testWidgets('demo screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Demo(),
    ));
    // Verify that our counter starts at 0.
    expect(find.text('demo screen'), findsOneWidget);
    expect(find.text('back to main screen'), findsOneWidget);
  });
}
