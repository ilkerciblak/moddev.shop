import 'package:fpdart/fpdart.dart';

/// Defines abstract api method that will be used in application
abstract interface class IApiService {
  // AUTHAPI
  TaskEither<Exception, Map<String, dynamic>> login({
    required String username,
    required String password,
  });
}
