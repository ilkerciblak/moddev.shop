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
          (r) => (r['products'] as List<dynamic>)
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
          (r) => (r['products'] as List<dynamic>)
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

  ProductDto _toProductDtoMapper(product) {
    return ProductDto(
      identifier: product['id'] ?? 0,
      categoryId: product['categoryId'] ?? 0,
      productName: product['title'] ?? product['name'] ?? '',
      productDescription: product['description'] ?? 'description',
      categoryName: product['categoryName'] ?? product['category'] ?? '',
      price: product['price'] ?? 0,
      avgRating: product['rating'] ?? 0,
      stockAmount: product['stock'] ?? 0,
      thumbnailUrl: product['thumbnail'] ?? '',
      images: (product['images'] ?? [])
          .map<String>(
            (image) => image.toString(),
          )
          .toList(),
      reviews: (product['reviews'] ?? []).map<ReviewDto>(
        (review) {
          return ReviewDto(
            rating: review['rating'],
            comment: review['comment'],
            reviewerName: review['reviewerName'],
            date: DateTime.tryParse(review['date']) ?? DateTime.now(),
            reviewerEmail: review['reviewerName'],
          );
        },
      ).toList(),
    );
  }
}
