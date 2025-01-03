import 'package:go_router/go_router.dart';
import 'package:mobile_application/presentation/catalog/product_detail/screen/product_detail_screen.dart';

class CatalogRouteRegistrar {
  static RouteBase get productDetailRoute => GoRoute(
        path: '/products/:id',
        name: 'product-detail',
        builder: (context, state) => ProductDetailScreen(
          productId: state.pathParameters['id']!,
        ),
      );
}
