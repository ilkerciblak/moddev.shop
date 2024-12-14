import 'package:fpdart/fpdart.dart';

/// Defines abstract api method that will be used in application
abstract interface class IApiService {
  // AUTHAPI
  ApiTask login({
    required String username,
    required String password,
  });

  ApiTask getCurrentUser({
    required String accessToken,
  });
}

typedef ApiTask = TaskEither<Exception, Map<String, dynamic>>;
