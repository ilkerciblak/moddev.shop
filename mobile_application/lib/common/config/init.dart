// ignore_for_file: unused_local_variable

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/service/shared_preferences/_shared_preferences.dart';
import 'package:mobile_application/feature/authentication/data/service/dummy_authentication_service.dart';
import 'package:mobile_application/feature/cart/application/_application.dart';
import 'package:mobile_application/feature/cart/data/_data.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/category/application/_application.dart';
import 'package:mobile_application/feature/catalog/category/data/_data.dart';
import 'package:mobile_application/feature/catalog/category/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/product/application/_application.dart';
import 'package:mobile_application/feature/catalog/product/data/_data.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:path_provider/path_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_application/feature/_feature.dart';

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
  // final dir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter('lib/cache');
  // prefs.clear();

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

  final SharedPreferencesManager sharedPreferencesManager2 =
      getIt.registerSingleton(SharedPreferencesManager(preferences: prefs));

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
      secureStorage: const FlutterSecureStorage(
          iOptions: IOSOptions(
        accountName: 'moddev',
        // groupId: 'moddev',
        synchronizable: true,
        accessibility: KeychainAccessibility.first_unlock,
      )),
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

  final AuthenticationListenable auth =
      getIt.registerSingleton<AuthenticationListenable>(
          AuthenticationListenable.initial());

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
  // secureStorageService.clearAll();
  final IAuthenticationRepository authRepository =
      getIt.registerSingleton<IAuthenticationRepository>(
    AuthenticationRepository(
      service: dummyAuthService,
      tokenRepository: tokenRepository,
    ),
  );

  // User Feature

  final IUserService userService =
      getIt.registerSingleton<IUserService>(DummyUserService(api: apiService));

  final IUserRepository userRepository =
      getIt.registerSingleton<IUserRepository>(
          UserRepository(userService: userService));

  await getIt.allReady();

  // Catalog Feature

  // Category
  final ICategoryService categoryService =
      getIt.registerSingleton<ICategoryService>(
    DummyCategoryService(api: apiService),
  );

  final ICategoryRepository categoryRepository =
      getIt.registerSingleton<ICategoryRepository>(
          CategoryRepository(categoryService: categoryService));

  // Product

  final IProductService productService =
      getIt.registerSingleton<IProductService>(
    DummyProductService(api: apiService),
  );

  final IProductRepository productRepository =
      getIt.registerSingleton<IProductRepository>(
          ProductRepository(productService: productService));

  final ICartService cartService = getIt.registerSingleton<ICartService>(
      DummyCartService(apiService: apiService));

  getIt.registerSingleton<GenericHiveManager>(
    GenericHiveManager('cart_hive'),
    instanceName: 'cartHiveManager',
  );

  final ICartRequestHiveRepository cartRequestHiveRepository =
      getIt.registerSingleton<ICartRequestHiveRepository>(
    CartRequestHiveRepository(
        cacheManager:
            getIt<GenericHiveManager>(instanceName: 'cartHiveManager')),
  );

  final ICartRepository cartRepository =
      getIt.registerSingleton<ICartRepository>(
    DummyCartRepository(
        service: cartService,
        cartHiveRepo: cartRequestHiveRepository,
        tokenRepository: tokenRepository),
  );
}
