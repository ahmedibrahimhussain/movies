import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _flutterSecureStorage =
      FlutterSecureStorage();

  static Future<void> write(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String?> read(String key) async {
    return await _flutterSecureStorage.read(key: key);
  }

  static Future<void> delete(String key) async {
    await _flutterSecureStorage.delete(key: key);
  }

  static Future<bool> containsKey(String key) async {
    return await _flutterSecureStorage.containsKey(key: key);
  }
}
