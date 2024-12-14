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
}
