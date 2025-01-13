import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/cart/application/_application.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';
import 'package:fpdart/fpdart.dart' show TaskEither;

final class DummyCartRepository implements ICartRepository {
  final ICartService _service;
  final ICartRequestHiveRepository _cartHive;
  final TokenRepository _tokenRepository;

  DummyCartRepository({
    required ICartService service,
    required ICartRequestHiveRepository cartHiveRepo,
    required TokenRepository tokenRepository,
  })  : _service = service,
        _cartHive = cartHiveRepo,
        _tokenRepository = tokenRepository;

  @override
  TaskEither<Exception, void> addUpdateProduct(
      {required int productId, int quantity = 1}) {
    return _cartHive.addUpdateProduct(productId: productId, quantity: quantity);
  }

  @override
  TaskEither<Exception, Cart> getCart() {
    return _tokenRepository.getAccessToken().flatMap((token) {
      return _cartHive.getCachedCartRequest().flatMap((cartRequest) {
        return _service
            .getCart(cartRequest: cartRequest, accessToken: token)
            .map((cartDto) {
          return cartDto.toEntity();
        });
      });
    });
  }

  @override
  TaskEither<Exception, void> removeProduct({required int productId}) {
    return _cartHive.removeProduct(productId: productId);
  }

  @override
  TaskEither<Exception, void> checkout() {
    return _cartHive.removeCachedCartRequest();
  }
}
