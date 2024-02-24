// import 'package:safebox/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

  late SharedPreferences saveLocal;
class Constants {
  static String sharedPreferenceUserLoggedInKey = "false";
  static String sharedPreferenceUserTokenKey = "USERTOKEN";


  // Initialize SharedPreferences in a constructor or another method
 static Future<void> initializeSharedPreferences() async {
    saveLocal = await SharedPreferences.getInstance();
    // You can perform additional setup or checks if needed
  }

  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    saveLocal.setBool(
        Constants.sharedPreferenceUserLoggedInKey, isUserLoggedIn);
    return isUserLoggedIn;
  }

  static Future<bool?> getUerLoggedInSharedPreference() async {
    final bool? isUserLoggedIn =
        saveLocal.getBool(Constants.sharedPreferenceUserLoggedInKey);
    return isUserLoggedIn;
  }

  static Future<String> saveUserTokenSharedPreference(String token) async {
    saveLocal.setString(Constants.sharedPreferenceUserTokenKey, token);
    return token;
  }

  static Future<Object?> getUserTokenSharedPreference() async {
    SharedPreferences saveLocal = await SharedPreferences.getInstance();
    return saveLocal.get(Constants.sharedPreferenceUserTokenKey);
  }
}
