import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/common/service/authentication/domain/_domain.dart';

abstract interface class IAuthenticationService {
  TaskEither<Exception, AuthenticationResponseModel> login({
    required String username,
    required String password,
  });

  TaskEither<Exception, void> logout();
}
