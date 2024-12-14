import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/feature/user/domain/user.dart';

abstract interface class IUserRepository {
  TaskEither<Exception, User> getCurrentUser({required String accessToken});
}
