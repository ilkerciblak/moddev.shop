import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/feature/cart/domain/model/cart_request.dart';

abstract class ICartRequestHiveRepository {
  TaskEither<Exception, CartRequest> getCachedCartRequest();

  TaskEither<Exception, void> addUpdateProduct({
    required int productId,
    int quantity = 1,
  });

  TaskEither<Exception, void> removeProduct({required int productId});

  TaskEither<Exception, void> removeCachedCartRequest();
}
