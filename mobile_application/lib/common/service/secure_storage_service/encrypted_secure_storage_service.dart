import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_application/common/_common.dart';

final class EncryptedSecureStorageService {
  final FlutterSecureStorage _secureStorage;
  final EncryptionService _encryptionService;

  EncryptedSecureStorageService({
    required FlutterSecureStorage secureStorage,
    required EncryptionService encryptionService,
  })  : _encryptionService = encryptionService,
        _secureStorage = secureStorage;

  Future<void> setString({required String key, required String value}) async {
    String encrypted = _encryptionService.encypt(value);
    await _secureStorage.write(key: key, value: encrypted);
  }

  Future<String> getString({required String key}) async {
    String? encrypted = await _secureStorage.read(key: key);
    String? value = _encryptionService.decrypt(encrypted);

    return value;
  }

  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
