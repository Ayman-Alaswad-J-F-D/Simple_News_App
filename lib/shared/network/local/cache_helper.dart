import 'package:get_storage/get_storage.dart';

class CacheHelper {
  static GetStorage storage = GetStorage();

  static dynamic getData({required String key}) {
    return storage.read(key);
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    return await storage.write(key, value);
  }

  static Future<void> removeData({
    required String key,
  }) async {
    return await storage.remove(key);
  }
}
