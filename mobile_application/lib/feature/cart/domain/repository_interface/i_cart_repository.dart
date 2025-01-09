import 'package:mobile_application/feature/cart/domain/model/cart.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ICartRepository {
  TaskEither<Exception, Cart> getCart();

  TaskEither<Exception, void> addUpdateProduct({
    required int productId,
    int quantity = 1,
  });

  TaskEither<Exception, void> removeProduct({
    required int productId,
  });
}
