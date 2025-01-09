import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';

class CartScreenState {
  final ActionResult<Cart> cart;

  CartScreenState({required this.cart});

  CartScreenState copyWith({
    ActionResult<Cart>? cart,
  }) {
    return CartScreenState(
      cart: cart ?? this.cart,
    );
  }

  factory CartScreenState.initial() => CartScreenState(cart: const Loading());

  @override
  bool operator ==(covariant CartScreenState other) {
    if (identical(this, other)) return true;

    return other.cart == cart;
  }

  @override
  int get hashCode => cart.hashCode;
}
