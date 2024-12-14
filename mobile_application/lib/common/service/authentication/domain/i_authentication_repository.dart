import 'package:fpdart/fpdart.dart';

abstract interface class IAuthenticationRepository {
  TaskEither<Exception, void> login({
    required String username,
    required String password,
  });

  TaskEither<Exception, void> logout();
}
