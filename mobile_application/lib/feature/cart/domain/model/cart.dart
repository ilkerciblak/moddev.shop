// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile_application/feature/cart/domain/collection/cart_product_collection.dart';

class Cart {
  final int identifier;
  final int userId;

  /// Defines variaty of different products
  final int productQuantity;

  /// Defines total number of products
  final int totalProductCount;
  final double price;
  final int discountedPrice;
  final CartProductCollection products;

  Cart({
    required this.identifier,
    required this.userId,
    required this.productQuantity,
    required this.totalProductCount,
    required this.price,
    required this.discountedPrice,
    required this.products,
  });

  factory Cart.emptyState() {
    return Cart(
      identifier: 0,
      userId: 0,
      productQuantity: 0,
      totalProductCount: 0,
      price: 0.0,
      discountedPrice: 0,
      products: CartProductCollection.empty(),
    );
  }

  Cart copyWith({
    int? identifier,
    int? userId,
    int? productQuantity,
    int? totalProductCount,
    double? price,
    int? discountedPrice,
    CartProductCollection? products,
  }) {
    return Cart(
      identifier: identifier ?? this.identifier,
      userId: userId ?? this.userId,
      productQuantity: productQuantity ?? this.productQuantity,
      totalProductCount: totalProductCount ?? this.totalProductCount,
      price: price ?? this.price,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      products: products ?? this.products,
    );
  }

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.userId == userId &&
        other.productQuantity == productQuantity &&
        other.totalProductCount == totalProductCount &&
        other.price == price &&
        other.discountedPrice == discountedPrice &&
        other.products == products;
  }

  @override
  int get hashCode {
    return identifier.hashCode ^
        userId.hashCode ^
        productQuantity.hashCode ^
        totalProductCount.hashCode ^
        price.hashCode ^
        discountedPrice.hashCode ^
        products.hashCode;
  }
}
