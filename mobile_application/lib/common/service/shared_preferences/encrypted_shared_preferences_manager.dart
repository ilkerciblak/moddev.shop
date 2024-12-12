import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/common/service/shared_preferences/shared_preferences_manager.dart';

class EncryptedSharedPreferencesManager extends SharedPreferencesManager {
  final EncryptionService _encryptionManager;

  EncryptedSharedPreferencesManager({
    required super.preferences,
    required EncryptionService encryptionManager,
  }) : _encryptionManager = encryptionManager;

  @override
  Future<void> saveString(String key, String value) {
    return super.saveString(key, _encryptionManager.encypt(value));
  }

  @override
  String? getString(String key) {
    return _encryptionManager.decrypt(super.getString(key));
  }
}
