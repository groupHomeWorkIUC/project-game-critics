import 'package:get_storage/get_storage.dart';
import 'package:project_game_critics/models/user.dart';

class Storage {
  static final GetStorage _storage = GetStorage('GameCritics');

  static clearStorage() async {
    await _storage.erase();
  }

  static void clearKey(String key) {
    _storage.remove(key);
  }

  static void setUser(User? user) {
    _storage.write('user', user!.toJson());
  }

  static getUser() {
    return _storage.read('user');
  }

  static void setAccessToken(String accessToken) {
    _storage.write('accessToken', accessToken);
  }

  static String? get getAccessToken {
    return _storage.read('accessToken');
  }

  static void clearAccessToken() {
    _storage.remove('accessToken');
  }

  static void setEmail(String email) {
    _storage.write('email', email);
  }

  static String? get getEmail {
    return _storage.read('email');
  }

  static bool? get darkThemeEnabled {
    return _storage.read('darkModeEnabled') ?? false;
  }

  static void setDarkThemeEnabled(bool value) {
    _storage.write('darkModeEnabled', value);
  }
}
