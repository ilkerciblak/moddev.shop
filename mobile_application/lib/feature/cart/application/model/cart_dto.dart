import 'package:collection/collection.dart';
import 'package:mobile_application/feature/cart/application/model/cart_product_dto.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';

final class CartDto {
  final int identifier;
  final int userId;

  /// Defines variaty of different products
  final int productQuantity;

  /// Defines total number of products
  final int totalProductCount;
  final double price;
  final int discountedPrice;
  final List<CartProductDto> products;

  CartDto(
      {required this.identifier,
      required this.userId,
      required this.productQuantity,
      required this.totalProductCount,
      required this.price,
      required this.discountedPrice,
      required this.products});

  Cart toEntity() => Cart(
        identifier: identifier,
        userId: userId,
        productQuantity: productQuantity,
        totalProductCount: totalProductCount,
        price: price,
        discountedPrice: discountedPrice,
        products: CartProductCollection.fromIterable(
          products.map((e) => e.toEntity()),
        ),
      );

  @override
  bool operator ==(covariant CartDto other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.identifier == identifier &&
        other.userId == userId &&
        other.productQuantity == productQuantity &&
        other.totalProductCount == totalProductCount &&
        other.price == price &&
        other.discountedPrice == discountedPrice &&
        listEquals(other.products, products);
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
