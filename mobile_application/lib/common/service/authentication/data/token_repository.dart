import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/common/service/authentication/domain/_domain.dart';
import 'package:mobile_application/common/service/secure_storage_service/encrypted_secure_storage_service.dart';

final class TokenRepository {
  final EncryptedSecureStorageService _storageService;

  TokenRepository({required EncryptedSecureStorageService storageService})
      : _storageService = storageService;

  TaskEither<Exception, void> saveAccessToken(String accessToken) {
    return TaskEither.Do(
      ($) async {
        await _storageService.setString(
          key: AuthenticationConstants.accessTokenKey,
          value: accessToken,
        );
      },
    );
  }

  TaskEither<Exception, void> saveRefreshToken(String refreshToken) {
    return TaskEither.Do(
      ($) async {
        await _storageService.setString(
          key: AuthenticationConstants.refreshTokenKey,
          value: refreshToken,
        );
      },
    );
  }

  TaskEither<Exception, String> getAccessToken() {
    return TaskEither.Do(($) async {
      return await _storageService.getString(
          key: AuthenticationConstants.accessTokenKey);
    });
  }

  TaskEither<Exception, String> getRefreshToken() {
    return TaskEither.Do(($) async {
      return await _storageService.getString(
          key: AuthenticationConstants.refreshTokenKey);
    });
  }

  TaskEither<Exception, void> clearTokens() {
    return TaskEither.Do(
      ($) async {
        await _storageService.clearAll();
      },
    );
  }
}
