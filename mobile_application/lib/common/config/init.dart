// ignore_for_file: unused_local_variable

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/service/authentication/domain/i_authentication_repository.dart';
import 'package:mobile_application/common/service/encryption/encrypter_mode.dart';
import 'package:mobile_application/feature/authentication/data/service/dummy_authentication_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

/// Initializes Project Dependencies and Common Service Singletons
///
/// - Package Initializations (dotenv, shared-preferences etc..)
/// - Common Services (NetworkService, Authentication etc..)
///
Future<void> initProjectDependencies() async {
  // Initializing environment file and constants
  await dotenv.load(fileName: 'lib/common/config/.env');
  // Initializing shared prefences instance
  final prefs = await SharedPreferences.getInstance();

  /// Register of
  ///  - Encryption Service
  ///  - SharedPreferences Manager w/ Encryption
  ///  - Secure Storage Manager w/ Encryption
  final EncryptionService encryptionService =
      getIt.registerSingleton<EncryptionService>(
    EncryptionService(
        secureKey: dotenv.env['SECURE_KEY']!,
        encrypterMode: EncrypterMode.fernet),
  );

  final EncryptedSharedPreferencesManager sharedPreferencesManager =
      getIt.registerSingleton<EncryptedSharedPreferencesManager>(
    EncryptedSharedPreferencesManager(
      preferences: prefs,
      encryptionManager: encryptionService,
    ),
  );

  final EncryptedSecureStorageService secureStorageService =
      getIt.registerSingleton<EncryptedSecureStorageService>(
    EncryptedSecureStorageService(
      secureStorage: const FlutterSecureStorage(),
      encryptionService: encryptionService,
    ),
  );

  // Network Service Register
  final NetworkService networkService = getIt.registerSingleton<NetworkService>(
    NetworkService(
      baseUrl: dotenv.env['BASE_URL']!,
    ),
  );

  // Base API Register
  final IApiService apiService = getIt.registerSingleton<IApiService>(
    DummyJsonApi(networkService: networkService),
  );

  // Authentication Service Register
  final IAuthenticationService dummyAuthService =
      getIt.registerSingleton<IAuthenticationService>(
    DummyAuthenticationService(apiService: apiService),
  );

  final TokenRepository tokenRepository =
      getIt.registerSingleton<TokenRepository>(
    TokenRepository(
      storageService: secureStorageService,
    ),
  );

  final IAuthenticationRepository authRepository =
      getIt.registerSingleton<IAuthenticationRepository>(
    AuthenticationRepository(
      service: dummyAuthService,
      tokenRepository: tokenRepository,
    ),
  );

  await getIt.allReady();
}
