// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';

class ProductDetailState {
  final ActionResult<Product> product;

  ProductDetailState({required this.product});

  ProductDetailState copyWith({
    ActionResult<Product>? product,
  }) {
    return ProductDetailState(
      product: product ?? this.product,
    );
  }

  factory ProductDetailState.initial() => ProductDetailState(
        product: const Loading(),
      );

  @override
  bool operator ==(covariant ProductDetailState other) {
    if (identical(this, other)) return true;

    return other.product == product;
  }

  @override
  int get hashCode => product.hashCode;
}
