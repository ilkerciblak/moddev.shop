import 'package:hive/hive.dart';

final class GenericHiveManager<T> {
  final String key;
  Box<Map<dynamic, dynamic>>? _box;

  GenericHiveManager(this.key);

  Future<void> init() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<Map<dynamic, dynamic>>(key);
    }
  }

  Future<void> clear() async {
    await _box?.clear();
  }

  Future<void> remove(String key) async {
    await _box?.delete(key);
  }

  Future<void> addItem(String key, Map<dynamic, dynamic> model) async {
    await _box?.put(key, model);
  }

  Map<dynamic, dynamic>? getItem(String key) {
    var data = _box?.get(key);

    return data;
  }
}
