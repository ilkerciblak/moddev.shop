import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:mobile_application/common/api/query_parameters.dart';
import 'package:mobile_application/feature/catalog/product/application/_application.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';

final class ProductRepository implements IProductRepository {
  final IProductService _productService;

  ProductRepository({required IProductService productService})
      : _productService = productService;
  @override
  TaskEither<Exception, List<Product>> getAllProducts(
    QueryParameters? queryParameters,
  ) {
    return _productService
        .getAllProducts(
          queryParameters: queryParameters,
        )
        .map(
          (r) => r
              .map(
                (e) => e.toEntity(),
              )
              .toList(),
        );
  }

  @override
  TaskEither<Exception, Product> getProductById(
      QueryParameters? queryParameters,
      {required int productId}) {
    return _productService
        .getProductById(queryParameters, productId: productId)
        .map(
          (r) => r.toEntity(),
        );
  }

  @override
  TaskEither<Exception, List<Product>> getProductsByCategory(
      QueryParameters? queryParameters,
      {required String categorySlug}) {
    return _productService
        .getAllProductsByCategory(queryParameters, categorySlug: categorySlug)
        .map(
          (r) => r
              .map(
                (e) => e.toEntity(),
              )
              .toList(),
        );
  }
}
