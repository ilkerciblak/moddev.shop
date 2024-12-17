import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/user/application/_application.dart';
import 'package:fpdart/fpdart.dart';

final class DummyUserService implements IUserService {
  final IApiService _api;

  DummyUserService({required IApiService api}) : _api = api;
  @override
  TaskEither<Exception, UserDto> getCurrentUser({required String accessToken}) {
    return _api.getCurrentUser(accessToken: accessToken).map(
      (userMap) {
        return _userDtoMapper(userMap);
      },
    );
  }

  /// Creating (SignUp) request for new user
  ///
  /// - parameter [UserDto] `userDto` is required
  /// - returns [UserDto] object if succeed
  @override
  TaskEither<Exception, UserDto> createUser({required UserDto userDto}) {
    return _api
        .createUser(requestBody: _jsonMapper(userDto))
        .map((r) => _userDtoMapper(r));
  }

  /// Dummy Map<String, dynamic> to UserDto mapper
  UserDto _userDtoMapper(Map<String, dynamic> r) {
    return UserDto(
      identifier: r['id'] ?? 0,
      firstName: r['firstName'] ?? '',
      lastName: r['lastName'] ?? '',
      email: r['email'] ?? '',
      imageUrl: r['image'] ?? '',
      userPaymentMethod: UserPaymentMethodDto(
        cardNumber: r['bank']['cardNumber'] ?? '',
        cardType: r['bank']['cardType'] ?? '',
        cartExpire: r['bank']['cardExpire'] ?? '',
      ),
      userAddress: UserAddressDto(
        city: r['address']['city'],
        state: r['address']['state'],
        address: r['address']['address'],
        postalCode: r['address']['postalCode'],
      ),
    );
  }

  /// Dummy UserDto to Map<String, dynamic> mapper
  Map<String, dynamic> _jsonMapper(UserDto userDto) {
    return {
      'firstName': userDto.firstName,
      'lastName': userDto.lastName,
      'email': userDto.email,
    };
  }
}
