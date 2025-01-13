import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';
import 'package:mobile_application/presentation/cart/controller/cart_screen_state.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  CartScreenCubit() : super(CartScreenState.initial()) {
    getCart();
  }

  final ICartRepository _cartRepository = GetIt.instance<ICartRepository>();

  Future<ActionResult<Cart>> getCart() async {
    var response = await _cartRepository.getCart().run();

    return response.fold(
      (l) {
        emit(state.copyWith(cart: Success(Cart.emptyState())));
        return state.cart;
      },
      (r) {
        emit(state.copyWith(cart: Success(r)));
        return state.cart;
      },
    );
  }

  Future<ActionResult<void>> deleteProduct(int productId) async {
    var response =
        await _cartRepository.removeProduct(productId: productId).run();

    await getCart();

    return response.fold(
      (l) => Failure(l),
      (r) => const Success(),
    );
  }

  Future<ActionResult<void>> checkout() async {
    var response = await _cartRepository.checkout().run();

    await getCart();

    return response.fold(
      (l) => Failure(l),
      (r) => const Success(),
    );
  }

  // Future<ActionResult<void>> updateProductQuantity({
  //   required int productId,
  //   int quantity = 1,
  // }) async {
  //   var response = await _cartRepository
  //       .addUpdateProduct(productId: productId, quantity: quantity)
  //       .run();

  //   await getCart();

  //   return response.fold(
  //     (l) => Failure(l),
  //     (r) => const Success(),
  //   );
  // }
}
