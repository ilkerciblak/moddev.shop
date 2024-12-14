import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
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
}
