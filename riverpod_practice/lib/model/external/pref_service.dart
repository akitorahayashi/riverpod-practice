import 'package:shared_preferences/shared_preferences.dart';

PrefService prefService_1 = PrefService();
PrefService prefService_2 = PrefService();

class PrefService {
  static final PrefService _instance = PrefService._internal();
  static SharedPreferences? _pref;

  PrefService._internal();

  factory PrefService() {
    return _instance;
  }

  Future<SharedPreferences> get sharedPreferences async {
    _pref ??= await SharedPreferences.getInstance();
    return _pref!;
  }
}
