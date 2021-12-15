import 'package:get_storage/get_storage.dart';

class Storage {
  static final GetStorage _storage = GetStorage('GameCritics');

  static clearStorage() async {
    await _storage.erase();
  }

  static void setAccessToken(String accessToken) {
    _storage.write('accessToken', accessToken);
  }

  static String? get getAccessToken {
    return _storage.read('accessToken');
  }

  static void setEmail(String email) {
    _storage.write('email', email);
  }

  static String? get getEmail {
    return _storage.read('email');
  }
}