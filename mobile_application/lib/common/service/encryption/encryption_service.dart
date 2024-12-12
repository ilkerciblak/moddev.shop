import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:mobile_application/common/service/encryption/encrypter_mode.dart';

final class EncryptionService {
  final String secureKey;
  final EncrypterMode encrypterMode;
  late final IV? iv;

  EncryptionService({
    required this.secureKey,
    required this.encrypterMode,
  }) : iv = encrypterMode.getIv;

  Encrypter get encrypter {
    switch (encrypterMode) {
      case EncrypterMode.fernet:
        return configureFernetEncrpyter();
      case EncrypterMode.aes:
        throw UnimplementedError(
            'AES typed encryption is not implemented at $runtimeType');
      case EncrypterMode.salsa20:
        return configureSalsa20Encrypter();
      default:
        return configureFernetEncrpyter();
    }
  }

  Encrypter configureFernetEncrpyter() {
    final key = Key.fromUtf8(secureKey);
    final b64Key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));
    return Encrypter(Fernet(b64Key));
  }

  Encrypter configureSalsa20Encrypter() {
    final key = Key.fromUtf8(secureKey);
    final b64Key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 24));

    return Encrypter(Salsa20(b64Key));
  }

  String encypt(String plainText) {
    final encrytedText = encrypter.encrypt(plainText, iv: iv);
    return encrytedText.base64;
  }

  String decrypt(String? encryptedText) {
    if (encryptedText != null) {
      final decryptedText = encrypter.decrypt64(encryptedText, iv: iv);
      return decryptedText;
    }
    return '';
  }
}
