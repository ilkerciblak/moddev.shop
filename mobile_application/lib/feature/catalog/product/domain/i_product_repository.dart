import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/common/_common.dart';
import 'product.dart';

abstract interface class IProductRepository {
  TaskEither<Exception, List<Product>> getAllProducts(
    QueryParameters? queryParameters,
  );

  TaskEither<Exception, Product> getProductById(
    QueryParameters? queryParameters, {
    required int productId,
  });

  TaskEither<Exception, List<Product>> getProductsByCategory(
    QueryParameters? queryParameters, {
    required String categorySlug,
  });
}
