import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mobile_application/feature/cart/domain/model/cart_product.dart';

final class CartProductCollection {
  IMap<int, CartProduct> collection;

  CartProductCollection(this.collection);

  factory CartProductCollection.fromIterable(Iterable<CartProduct> iterable) {
    return CartProductCollection(iterable.buildIMapFromIterable());
  }

  factory CartProductCollection.empty() => CartProductCollection(
        const IMap<int, CartProduct>.empty(),
      );

  bool containsProduct(int id) {
    return collection.values.any(
      (element) => element.identifier == id,
    );
  }

  int productQuantity(int id) {
    return containsProduct(id)
        ? collection.values
            .firstWhere(
              (element) => element.identifier == id,
            )
            .quantity
        : 0;
  }

  @override
  bool operator ==(covariant CartProductCollection other) {
    if (identical(this, other)) return true;

    return other.collection == collection;
  }

  @override
  int get hashCode => collection.hashCode;
}

extension IterableX on Iterable<CartProduct> {
  IMap<int, CartProduct> buildIMapFromIterable() {
    var _map = <int, CartProduct>{};

    for (var cartProduct in this) {
      _map[cartProduct.identifier] = cartProduct;
    }

    return _map.lock;
  }
}
