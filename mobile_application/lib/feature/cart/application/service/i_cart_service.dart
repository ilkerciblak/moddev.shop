import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/feature/cart/application/model/cart_dto.dart';
import 'package:mobile_application/feature/cart/domain/model/cart_request.dart';

abstract interface class ICartService {
  TaskEither<Exception, CartDto> getCart({
    required CartRequest cartRequest,
    required String accessToken,
  });

  TaskEither<Exception, void> addUpdateProduct({
    required CartRequest cartRequest,
    required String accessToken,
  });

  TaskEither<Exception, void> removeProduct({
    required CartRequest cartRequest,
    required String accessToken,
  });
}
