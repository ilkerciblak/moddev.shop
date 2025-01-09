import 'package:mobile_application/feature/cart/domain/model/cart_product.dart';

final class CartProductDto {
  final int identifier;
  final String title;
  final double price;
  final int quantity;
  final double totalPrice;
  final double discountPercentage;
  final int discountedTotalPrice;
  final String thumbnail;

  CartProductDto({
    required this.identifier,
    required this.title,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.discountPercentage,
    required this.discountedTotalPrice,
    required this.thumbnail,
  });

  CartProduct toEntity() => CartProduct(
      identifier: identifier,
      title: title,
      price: price,
      quantity: quantity,
      totalPrice: totalPrice,
      discountPercentage: discountPercentage,
      discountedTotalPrice: discountedTotalPrice,
      thumbnail: thumbnail);

  CartProductDto copyWith({
    int? identifier,
    String? title,
    double? price,
    int? quantity,
    double? totalPrice,
    double? discountPercentage,
    int? discountedTotalPrice,
    String? thumbnail,
  }) {
    return CartProductDto(
      identifier: identifier ?? this.identifier,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountedTotalPrice: discountedTotalPrice ?? this.discountedTotalPrice,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  bool operator ==(covariant CartProductDto other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.title == title &&
        other.price == price &&
        other.quantity == quantity &&
        other.totalPrice == totalPrice &&
        other.discountPercentage == discountPercentage &&
        other.discountedTotalPrice == discountedTotalPrice &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return identifier.hashCode ^
        title.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        totalPrice.hashCode ^
        discountPercentage.hashCode ^
        discountedTotalPrice.hashCode ^
        thumbnail.hashCode;
  }
}
