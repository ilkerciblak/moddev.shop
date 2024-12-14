final class UserPaymentMethod {
  final String cardNumber;
  final String cardType;
  final String cartExpire;

  UserPaymentMethod({
    required this.cardNumber,
    required this.cardType,
    required this.cartExpire,
  });

  factory UserPaymentMethod.def() => UserPaymentMethod(
        cardNumber: '',
        cardType: '',
        cartExpire: '',
      );

  @override
  bool operator ==(covariant UserPaymentMethod other) {
    if (identical(this, other)) return true;

    return other.cardNumber == cardNumber &&
        other.cardType == cardType &&
        other.cartExpire == cartExpire;
  }

  @override
  int get hashCode =>
      cardNumber.hashCode ^ cardType.hashCode ^ cartExpire.hashCode;
}
