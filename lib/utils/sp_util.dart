import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static const String _access_token = 'access_token';
  static const String _refresh_token = 'refresh_token';
  static const String _token_type = 'token_type';

  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get checkAccessToken => _prefs.containsKey(_access_token);
  static String get accessToken => _prefs.getString(_access_token)!;
  static set accessToken(String token) =>
      _prefs.setString(_access_token, token);
  static void clearAccessToken() => _prefs.remove(_access_token);

  static bool get checkRefreshToken => _prefs.containsKey(_refresh_token);
  static String get refreshToken => _prefs.getString(_refresh_token)!;
  static set refreshToken(String token) =>
      _prefs.setString(_refresh_token, token);
  static void clearRefreshToken() => _prefs.remove(_refresh_token);

  static bool get checkTokenType => _prefs.containsKey(_token_type);
  static String get tokenType => _prefs.getString(_token_type)!;
  static set tokenType(String tokenType) =>
      _prefs.setString(_token_type, tokenType);
  static void clearTokenType() => _prefs.remove(_token_type);
}
