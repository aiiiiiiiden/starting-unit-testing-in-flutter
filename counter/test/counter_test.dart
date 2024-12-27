import 'package:counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Counter', () {
    test('initial counter value is 0', () async {
      SharedPreferences.setMockInitialValues({});
      final counter = await Counter.create();
      expect(counter.count, 0);
    });
    test('increment counter increments the counter', () async {
      SharedPreferences.setMockInitialValues({});
      final counter = await Counter.create();
      counter.increment();
      expect(counter.count, 1);
    });
    test('increment counter resets to 0 over 999999', () async {
      SharedPreferences.setMockInitialValues({"count": 999998});
      final counter = await Counter.create();
      expect(counter.count, 999998);
      counter.increment();
      expect(counter.count, 999999);
      counter.increment();
      expect(counter.count, 0);
    });
  });
}
