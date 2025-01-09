// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartRequestProduct {
  final int id;
  final int quantity;

  CartRequestProduct({required this.id, required this.quantity});

  CartRequestProduct copyWith({
    int? id,
    int? quantity,
  }) {
    return CartRequestProduct(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(covariant CartRequestProduct other) {
    if (identical(this, other)) return true;

    return other.id == id && other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
    };
  }

  factory CartRequestProduct.fromMap(Map<dynamic, dynamic> map) {
    return CartRequestProduct(
      id: map['id'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartRequestProduct.fromJson(String source) =>
      CartRequestProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}
