import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mobile_application/feature/cart/domain/model/cart_request_product.dart';

final class CartRequestProductCollection {
  IMap<int, CartRequestProduct> _collection;

  CartRequestProductCollection(IMap<int, CartRequestProduct> collection)
      : _collection = collection;

  factory CartRequestProductCollection.empty() => CartRequestProductCollection(
        const IMap<int, CartRequestProduct>.empty(),
      );

  // factory CartRequestProductCollection.fromMap() =>
  //     CartRequestProductCollection(
  //       collection,
  //     );

  // TODO: fromMap && toMap in order to work with hive data

  CartRequestProductCollection removeProduct(int productId) {
    return CartRequestProductCollection(_collection.remove(productId));
  }

  CartRequestProductCollection addUpdateProduct(
    CartRequestProduct cartRequestProduct,
  ) {
    return CartRequestProductCollection(_collection.inject(cartRequestProduct));
  }

  List<Map<String, dynamic>> toMap() {
    return _collection.values
        .map(
          (e) => e.toMap(),
        )
        .toList();
  }

  factory CartRequestProductCollection.fromMap(List<dynamic> list) {
    final Iterable<CartRequestProduct> plist =
        list.map((e) => CartRequestProduct.fromMap(e));
    return CartRequestProductCollection(plist.buildIMapFromIterable());
  }
}

extension IMapX on IMap<int, CartRequestProduct> {
  IMap<int, CartRequestProduct> inject(CartRequestProduct cartRequestProduct) {
    var unlocked = unlock;

    unlocked[cartRequestProduct.id] = cartRequestProduct;

    return unlocked.lock;
  }

  IMap<int, CartRequestProduct> remove(CartRequestProduct cartRequestProduct) {
    var unlocked = unlock;

    unlocked.remove(cartRequestProduct.id);

    return unlock.lock;
  }
}

extension IMapIterableX on Iterable<CartRequestProduct> {
  IMap<int, CartRequestProduct> buildIMapFromIterable() {
    var _map = <int, CartRequestProduct>{};

    for (var cartProduct in this) {
      _map[cartProduct.id] = cartProduct;
    }

    return _map.lock;
  }
}
