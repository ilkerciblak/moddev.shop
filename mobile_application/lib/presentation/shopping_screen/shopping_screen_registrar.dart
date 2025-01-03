import 'package:go_router/go_router.dart';
import 'package:mobile_application/presentation/shopping_screen/shopping_screen.dart';

final class ShoppingScreenRegistrar {
  static RouteBase get shoppingRoute => GoRoute(
      path: '/shopping-screen',
      name: 'shop-screen',
      builder: (context, state) {
        return const ShoppingScreen();
      });
}
