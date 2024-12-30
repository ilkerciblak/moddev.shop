import 'package:go_router/go_router.dart';
import 'package:mobile_application/feature/catalog/product/presentation/screen/product_detail_screen/product_detail_screen.dart';

class ProductRouteRegistrar {
  static RouteBase get productDetailRoute => GoRoute(
        path: '/products/:id',
        name: 'product-detail',
        builder: (context, state) => ProductDetailScreen(
          productId: state.pathParameters['id']!,
        ),
      );
}
