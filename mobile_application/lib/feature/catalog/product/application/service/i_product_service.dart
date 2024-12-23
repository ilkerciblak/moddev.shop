import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/product/application/model/product_dto.dart';

abstract interface class IProductService {
  TaskEither<Exception, List<ProductDto>> getAllProducts(
      QueryParameters? queryParameters);

  TaskEither<Exception, List<ProductDto>> getAllProductsByCategory(
    QueryParameters? queryParameters, {
    required String categorySlug,
  });

  TaskEither<Exception, ProductDto> getProductById(
    QueryParameters? queryParameters, {
    required int productId,
  });
}
