final class UserAddress {
  final String city;
  final String state;
  final String address;
  final String postalCode;

  UserAddress({
    required this.city,
    required this.state,
    required this.address,
    required this.postalCode,
  });

  factory UserAddress.def() => UserAddress(
        city: '',
        state: '',
        address: '',
        postalCode: '',
      );

  @override
  bool operator ==(covariant UserAddress other) {
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
