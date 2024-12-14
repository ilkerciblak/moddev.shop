import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/feature/user/application/model/_model.dart';

abstract interface class IUserService {
  TaskEither<Exception, UserDto> getCurrentUser({
    required String accessToken,
  });
}
