import 'package:go_router/go_router.dart';
import 'package:mobile_application/presentation/cart/cart_screen.dart';

final class CartScreenRouteRegistrar {
  static RouteBase get cartScreen => GoRoute(
        path: '/cart',
        name: 'cart-screen',
        builder: (context, state) => const CartScreen(),
      );
}
