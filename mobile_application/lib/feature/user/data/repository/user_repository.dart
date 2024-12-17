import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/feature/user/application/_application.dart';
import 'package:mobile_application/feature/user/domain/_domain.dart';

final class UserRepository implements IUserRepository {
  final IUserService _userService;

  UserRepository({required IUserService userService})
      : _userService = userService;
  @override
  TaskEither<Exception, User> getCurrentUser({required String accessToken}) {
    return _userService.getCurrentUser(accessToken: accessToken).map(
      (userDto) {
        return userDto.toEntity();
      },
    );
  }

  @override
  TaskEither<Exception, User> createUser({required User user}) {
    return _userService
        .createUser(
          userDto: UserDto.fromEntity(user),
        )
        .map(
          (r) => r.toEntity(),
        );
  }
}
