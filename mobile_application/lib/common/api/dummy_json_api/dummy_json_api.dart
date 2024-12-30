import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_application/common/api/query_parameters.dart';
import 'package:mobile_application/common/service/_service.dart';
import 'package:mobile_application/common/api/i_api_service.dart';

final class DummyJsonApi implements IApiService {
  final NetworkService _networkService;

  DummyJsonApi({required NetworkService networkService})
      : _networkService = networkService;
  @override
  ApiTask login({required String username, required String password}) {
    return _networkService.post(
      path: dotenv.env['LOGIN_PATH']!,
      requestBody: {
        'username': username,
        'password': password,
        'expiresInMins': dotenv.get('EXPIRE_IN_MINS', fallback: '30'),
      },
    );
  }

  @override
  ApiTask getCurrentUser({required String accessToken}) {
    return _networkService.get(
      path: dotenv.env['GET_USER_PATH']!,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  @override
  ApiTask createUser({required Map<String, dynamic> requestBody}) {
    return _networkService.post(
      path: dotenv.env['CREATE_USER_PATH']!,
      requestBody: requestBody,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  @override
  ApiTask getAllCategories() {
    return _networkService.get(
      path: dotenv.env['GET_ALL_CATEGORIES_PATH']!,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  @override
  ApiTask getAllProducts({
    QueryParameters? queryParameters,
  }) {
    return _networkService.get(
      path: dotenv.env['GET_ALL_PRODUCTS']!,
      queryParameters: queryParameters?.toQueryParameter(),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  @override
  ApiTask getProductById(
    QueryParameters? queryParameters, {
    required int productId,
  }) {
    return _networkService.get(
      path: dotenv.env['GET_PRODUCT_BY_ID']!.replaceFirst(
        ':productId',
        productId.toString(),
      ),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      queryParameters: queryParameters?.toQueryParameter(),
    );
  }

  @override
  ApiTask getProductsByCategory(
    QueryParameters? queryParameters, {
    required String categorySlug,
  }) {
    return _networkService.get(
        path: dotenv.env['GET_PRODUCT_BY_CATEGORY']!.replaceFirst(
          ':categorySlug',
          categorySlug,
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        });
  }
}
