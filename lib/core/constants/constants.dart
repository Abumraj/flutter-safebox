// import 'package:safebox/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static String sharedPreferenceUserLoggedInKey = "false";
  static String sharedPreferenceUserTokenKey = "USERTOKEN";
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences in a constructor or another method

  static Future saveToken(String email) async {
    _preferences?.setString('token', email);
  }

  static String getToken() {
    return _preferences?.getString('token') ?? "";
  }

  static Future<void> initializeSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    // You can perform additional setup or checks if needed
  }

  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    _preferences?.setBool(
        Constants.sharedPreferenceUserLoggedInKey, isUserLoggedIn);
    return isUserLoggedIn;
  }

  static Future<bool?> getUerLoggedInSharedPreference() async {
    final bool? isUserLoggedIn =
        _preferences?.getBool(Constants.sharedPreferenceUserLoggedInKey);
    return isUserLoggedIn;
  }

  static Future<String> saveUserTokenSharedPreference(String token) async {
    _preferences?.setString(Constants.sharedPreferenceUserTokenKey, token);
    return token;
  }

  static Future<String?> getUserTokenSharedPreference() async {
    return _preferences?.get(Constants.sharedPreferenceUserTokenKey).toString();
  }
}
