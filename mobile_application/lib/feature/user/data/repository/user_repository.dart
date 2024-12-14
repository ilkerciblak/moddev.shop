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
        return User(
          identifier: userDto.identifier,
          firstName: userDto.firstName,
          lastName: userDto.lastName,
          email: userDto.email,
          imageUrl: userDto.imageUrl,
          userPaymentMethod: userDto.userPaymentMethod.toEntity(),
          userAddress: userDto.userAddress.toEntity(),
        );
      },
    );
  }
}
