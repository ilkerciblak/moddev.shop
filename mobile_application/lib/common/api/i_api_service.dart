import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/common/api/query_parameters.dart';

/// Defines abstract api method that will be used in application
abstract interface class IApiService {
  // AUTHAPI
  ApiTask login({
    required String username,
    required String password,
  });

  ApiTask getCurrentUser({
    required String accessToken,
  });

  ApiTask createUser({
    required Map<String, dynamic> requestBody,
  });

  // Catalog Domain Requests

  /// Api Request for Gettin All Categories, with no parameter
  ApiTask getAllCategories();

  /// Api Request for [Getting All Products],
  ///
  ApiTask getAllProducts(QueryParameters? queryParameters);

  /// Api Request for [Get A Single Product with Id]
  ///

  ApiTask getProductById(
    QueryParameters? queryParameters, {
    required int productId,
  });

  /// Api Request for [Get Product List by their Categories]
  ///
  /// - @param [String categorySlug], filtered categories slug
  ApiTask getProductsByCategory(
    QueryParameters? queryParameters, {
    required String categorySlug,
  });
}

typedef ApiTask = TaskEither<Exception, Map<String, dynamic>>;
