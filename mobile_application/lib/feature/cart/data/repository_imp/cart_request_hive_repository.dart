// ignore_for_file: avoid_print

import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';
import 'package:fpdart/fpdart.dart' show TaskEither;

final class CartRequestHiveRepository implements ICartRequestHiveRepository {
  final GenericHiveManager _cacheManager;
  static const String _key = 'cart_hive';
  CartRequestHiveRepository({required GenericHiveManager cacheManager})
      : _cacheManager = cacheManager {
    _cacheManager.init();
  }

  /// Adds a new product or updates product quantity in the cached [CartRequest]
  ///
  /// Parameters:
  /// * [productId]: integer identifier of the related product
  /// * [quantity]: optional integer quantity that will be held on the cart, defaults to 1
  ///
  /// Returns:
  /// [TaskEither] <Exception, void>,
  ///
  /// Adds the given product to the cached [CartRequest] with a quantity of 1. If product is already in cached [CartRequest]
  /// then it should be used to update [quantity] of the product.
  @override
  TaskEither<Exception, void> addUpdateProduct(
      {required int productId, int quantity = 1}) {
    return TaskEither.tryCatch(
      () async {
        // Get Cached [CartRequest] object from Hive.
        final cartRequest = await getCachedCartRequest().run().then(
          (value) {
            return value.fold(
              (l) => CartRequest(
                  userId: 0, products: CartRequestProductCollection.empty()),
              (r) => r,
            );
          },
        );

        // Generate a new CartRequest object with new product collection information
        final CartRequest newCartRequest = cartRequest.copyWith(
          products: cartRequest.products.addUpdateProduct(
            CartRequestProduct(id: productId, quantity: quantity),
          ),
        );

        // Save or Cache the new [CartRequest] object
        await _cacheManager.addItem(_key, newCartRequest.toMap());
      },
      (error, stackTrace) => Exception(),
    );
  }

  @override
  TaskEither<Exception, CartRequest> getCachedCartRequest() {
    return TaskEither.tryCatch(
      () async {
        // Try to get a cached [CartRequest] item from Hive Data Source.
        var cached = _cacheManager.getItem(_key);

        // If it is null, return a new [CartRequest] item with a empty product collection
        if (cached == null) {
          return CartRequest(
              userId: 0, products: CartRequestProductCollection.empty());
        }

        // If it is there, return [CartRequest] object with some mapping from Map<String, dynamic>
        return CartRequest.fromMap(cached);
      },
      (error, stackTrace) {
        return Exception('Something happended $error \n $stackTrace');
      },
    );
  }

  /// Removes the cached [CartRequest] object from the hive repository.
  @override
  TaskEither<Exception, void> removeCachedCartRequest() {
    return TaskEither.tryCatch(
      () async {
        await _cacheManager.clear();
      },
      (error, stackTrace) {
        return Exception();
      },
    );
  }

  @override
  TaskEither<Exception, void> removeProduct({required int productId}) {
    return TaskEither.tryCatch(
      () async {
        final cartRequest = await getCachedCartRequest().run().then(
          (value) {
            return value.fold(
              (l) => CartRequest(
                  userId: 0, products: CartRequestProductCollection.empty()),
              (r) => r,
            );
          },
        );

        // Generate a new CartRequest object with new product collection information, using [collection.removeProduct]
        final CartRequest newCartRequest = cartRequest.copyWith(
          products: cartRequest.products.removeProduct(productId),
        );

        // Save or Cache the new [CartRequest] object
        _cacheManager.addItem(_key, newCartRequest.toMap());
      },
      (error, stackTrace) {
        return Exception();
      },
    );
  }

  TaskEither<Exception, void> cache(CartRequest cartRequest) {
    return TaskEither.tryCatch(
      () async {
        await _cacheManager.addItem(_key, cartRequest.toMap());
      },
      (error, stackTrace) {
        return Exception();
      },
    );
  }
}
