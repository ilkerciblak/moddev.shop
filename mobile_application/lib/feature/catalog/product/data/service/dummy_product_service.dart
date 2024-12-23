import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/product/application/_application.dart';
import 'package:fpdart/fpdart.dart';

final class DummyProductService implements IProductService {
  final IApiService _api;

  DummyProductService({required IApiService api}) : _api = api;
  @override
  TaskEither<Exception, List<ProductDto>> getAllProducts(
      QueryParameters? queryParameters) {
    return _api.getAllProducts(queryParameters).map(
          (r) => (r['data'] as List<dynamic>)
              .map(
                (e) => _toProductDtoMapper(e),
              )
              .toList(),
        );
  }

  @override
  TaskEither<Exception, List<ProductDto>> getAllProductsByCategory(
    QueryParameters? queryParameters, {
    required String categorySlug,
  }) {
    return _api
        .getProductsByCategory(queryParameters, categorySlug: categorySlug)
        .map(
          (r) => (r['data'] as List<dynamic>)
              .map(
                (e) => _toProductDtoMapper(e),
              )
              .toList(),
        );
  }

  @override
  TaskEither<Exception, ProductDto> getProductById(
    QueryParameters? queryParameters, {
    required int productId,
  }) {
    return _api.getProductById(queryParameters, productId: productId).map(
          (r) => _toProductDtoMapper(r),
        );
  }

  ProductDto _toProductDtoMapper(e) {
    return ProductDto(
      identifier: e['id'] ?? '',
      categoryId: e['categoryId'] ?? '',
      categoryName: e['category'] ?? '',
      productName: e['title'] ?? '',
      productDescription: e['description'] ?? '',
      images: e['images'] ?? [],
      thumbnailUrl: e['thumbnail'] ?? '',
      price: e['price'] ?? 0.0,
      avgRating: e['rating'] ?? 0.0,
      stockAmount: e['stock'] ?? '',
      reviews: (e['reviews'] as List<dynamic>).map(
        (e) {
          return ReviewDto(
            rating: e['rating'] ?? 0,
            comment: e['comment'] ?? '',
            date: e['date'] ?? DateTime.now(),
            reviewerName: e['reviewerName'] ?? '',
            reviewerEmail: e['reviewerEmail'] ?? '',
          );
        },
      ).toList(),
    );
  }
}
