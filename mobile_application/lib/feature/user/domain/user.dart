import 'package:mobile_application/feature/user/domain/user_payment_method.dart';
import 'package:mobile_application/feature/user/domain/user_address.dart';

final class User {
  final int identifier;
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  final UserPaymentMethod userPaymentMethod;
  final UserAddress userAddress;

  User({
    required this.identifier,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
    required this.userPaymentMethod,
    required this.userAddress,
  });

  factory User.def() => User(
        identifier: 0,
        firstName: '',
        lastName: '',
        email: '',
        imageUrl: '',
        userPaymentMethod: UserPaymentMethod.def(),
        userAddress: UserAddress.def(),
      );

  @override
  bool operator ==(covariant User other) {
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