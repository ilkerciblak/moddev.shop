// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobile_application/feature/cart/domain/collection/cart_request_product_collection.dart';

class CartRequest {
  final int userId;
  final CartRequestProductCollection products;

  CartRequest({
    required this.userId,
    required this.products,
  });

  CartRequest copyWith({
    int? userId,
    CartRequestProductCollection? products,
  }) {
    return CartRequest(
      userId: userId ?? this.userId,
      products: products ?? this.products,
    );
  }

  @override
  bool operator ==(covariant CartRequest other) {
    if (identical(this, other)) return true;

    return other.userId == userId && other.products == products;
  }

  @override
  int get hashCode => userId.hashCode ^ products.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': 1,
      'products': products.toMap(),
    };
  }

  factory CartRequest.fromMap(Map<dynamic, dynamic> map) {
    return CartRequest(
      userId: map['userId'] as int,
      products: CartRequestProductCollection.fromMap(
        (map['products'] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartRequest.fromJson(String source) =>
      CartRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartRequest(userId: $userId, products: $products)';
}
