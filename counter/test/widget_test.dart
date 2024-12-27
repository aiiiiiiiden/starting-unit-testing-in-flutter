// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:counter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Counter Widget Tests', () {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.pumpWidget(const MyApp());
      await tester.pump();
      expect(find.text('0'), findsOne);
      expect(find.text('1'), findsNothing);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOne);
    });
    testWidgets('increment counter resets to 0 over 999999',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({"count": 999998});
      await tester.pumpWidget(const MyApp());
      await tester.pump();
      expect(find.text('999998'), findsOne);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('999999'), findsOne);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('0'), findsOne);
    });
  });
}
