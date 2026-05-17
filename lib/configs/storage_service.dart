import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  static Future<void> removeToken() async {
    await storage.delete(key: 'token');
  }

  static Future<void> saveRole(String role) async {
    await storage.write(key: 'role', value: role);
  }

  static Future<String?> getRole() async {
    return await storage.read(key: 'role');
  }

  static Future<void> saveUserId(int id) async {
    await storage.write(key: 'id', value: id.toString());
  }

  static Future<int?> getUserId() async {
    final value = await storage.read(key: 'id');

    if (value == null) return null;

    return int.parse(value);
  }
}
