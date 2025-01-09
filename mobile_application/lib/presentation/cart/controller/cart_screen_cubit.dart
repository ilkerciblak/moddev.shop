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
    emit(state.copyWith(cart: const Loading()));

    var response = await _cartRepository.getCart().run();
    // await Future.delayed(const Duration(seconds: 10));

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
}
