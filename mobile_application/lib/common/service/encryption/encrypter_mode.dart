import 'package:encrypt/encrypt.dart';

enum EncrypterMode {
  fernet,
  aes,
  salsa20,
}

extension EncripterModeX on EncrypterMode {
  IV? get getIv {
    switch (this) {
      case EncrypterMode.aes:
        return IV.fromLength(16);
      case EncrypterMode.salsa20:
        return IV.fromLength(8);
      case EncrypterMode.fernet:
        return null;
      default:
        return null;
    }
  }
}
