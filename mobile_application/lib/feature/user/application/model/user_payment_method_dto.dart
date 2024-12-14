import 'package:mobile_application/feature/user/domain/_domain.dart';

class UserPaymentMethodDto {
  final String cardNumber;
  final String cardType;
  final String cartExpire;

  UserPaymentMethodDto({
    required this.cardNumber,
    required this.cardType,
    required this.cartExpire,
  });

  UserPaymentMethod toEntity() => UserPaymentMethod(
        cardNumber: cardNumber,
        cardType: cardType,
        cartExpire: cartExpire,
      );

  @override
  bool operator ==(covariant UserPaymentMethodDto other) {
    if (identical(this, other)) return true;

    return other.cardNumber == cardNumber &&
        other.cardType == cardType &&
        other.cartExpire == cartExpire;
  }

  @override
  int get hashCode =>
      cardNumber.hashCode ^ cardType.hashCode ^ cartExpire.hashCode;
}
