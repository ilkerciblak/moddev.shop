import 'package:mobile_application/feature/user/domain/_domain.dart';

class UserAddressDto {
  final String city;
  final String state;
  final String address;
  final String postalCode;

  UserAddressDto(
      {required this.city,
      required this.state,
      required this.address,
      required this.postalCode});

  UserAddress toEntity() => UserAddress(
      city: city, state: state, address: address, postalCode: postalCode);

  @override
  bool operator ==(covariant UserAddressDto other) {
    if (identical(this, other)) return true;

    return other.city == city &&
        other.state == state &&
        other.address == address &&
        other.postalCode == postalCode;
  }

  @override
  int get hashCode {
    return city.hashCode ^
        state.hashCode ^
        address.hashCode ^
        postalCode.hashCode;
  }
}
