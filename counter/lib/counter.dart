import 'package:shared_preferences/shared_preferences.dart';

class Counter {
  final SharedPreferences _sharedPreferences;
  int _count;
  int get count => _count;
  Counter._({required sharedPreferences})
      : _count = sharedPreferences.getInt("count") ?? 0,
        _sharedPreferences = sharedPreferences;
  static Future<Counter> create() async {
    return Counter._(
      sharedPreferences: await SharedPreferences.getInstance(),
    );
  }

  void _save() => _sharedPreferences.setInt("count", _count);
  void increment() {
    _count++;
    if (_count >= 1000000) _count = 0;
    _save();
  }
}
