import 'package:mobile_application/feature/user/application/model/user_address_dto.dart';
import 'package:mobile_application/feature/user/application/model/user_payment_method_dto.dart';
import 'package:mobile_application/feature/user/domain/_domain.dart';

class UserDto {
  final int identifier;
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  final UserPaymentMethodDto userPaymentMethod;
  final UserAddressDto userAddress;

  UserDto(
      {required this.identifier,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.imageUrl,
      required this.userPaymentMethod,
      required this.userAddress});

  User toEntity() => User(
        identifier: identifier,
        firstName: firstName,
        lastName: lastName,
        email: email,
        imageUrl: imageUrl,
        userPaymentMethod: userPaymentMethod.toEntity(),
        userAddress: userAddress.toEntity(),
      );

  /// Factory Constructor that gives UserDto from User Entity Attributes
  ///
  /// - @param [User] `user` is required
  /// - @returns [UserDto.new] `UserDto object`
  factory UserDto.fromEntity(User user) => UserDto(
        identifier: user.identifier,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        imageUrl: user.imageUrl,
        userPaymentMethod: UserPaymentMethodDto(
            cardNumber: user.userPaymentMethod.cardNumber,
            cardType: user.userPaymentMethod.cardType,
            cartExpire: user.userPaymentMethod.cartExpire),
        userAddress: UserAddressDto(
            city: user.userAddress.city,
            state: user.userAddress.state,
            address: user.userAddress.address,
            postalCode: user.userAddress.postalCode),
      );

  @override
  bool operator ==(covariant UserDto other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.imageUrl == imageUrl &&
        other.userPaymentMethod == userPaymentMethod &&
        other.userAddress == userAddress;
  }

  @override
  int get hashCode {
    return identifier.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        imageUrl.hashCode ^
        userPaymentMethod.hashCode ^
        userAddress.hashCode;
  }
}
