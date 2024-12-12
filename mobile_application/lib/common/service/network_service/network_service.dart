import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/common/exception/base_exception.dart';
import 'package:http/http.dart' as http;

final class NetworkService {
  final String baseUrl;
  final Map<String, String> headers;
  final int timeOutSeconds;

  NetworkService({
    required this.baseUrl,
    this.timeOutSeconds = 10,
    this.headers = const {HttpHeaders.contentTypeHeader: 'application/json'},
  });

  TaskEither<Exception, Map<String, dynamic>> get({
    required String path,
    Map<String, String>? queryParameters = const {},
    Map<String, String>? headers = const {},
  }) {
    return TaskEither.tryCatch(
      () async {
        Uri uri = Uri.parse(baseUrl).replace(
          path: path,
          queryParameters: queryParameters,
          // query: searchString,
        );
        await Future.delayed(const Duration(seconds: 1));
        var result = await _sendRequest(
          request: http.get(
            uri,
            headers: headers,
          ),
        ).run().then(
              (result) => result.fold(
                (l) => throw l,
                (r) => r,
              ),
            );

        return result;
      },
      _handleException,
    );
  }

  TaskEither<Exception, Map<String, dynamic>> post({
    required String path,
    required Map<String, dynamic> requestBody,
    Map<String, String>? headers = const {},
  }) {
    return TaskEither.tryCatch(
      () async {
        Uri uri = Uri.parse(baseUrl).replace(path: path);
        var result = await _sendRequest(
          request: http.post(
            uri,
            body: jsonEncode(requestBody),
            headers: this.headers,
          ),
        ).run().then(
              (r) => r.fold((l) => throw l, (r) => r),
            );

        return result;
      },
      _handleException,
    );
  }

  TaskEither<Exception, Map<String, dynamic>> _sendRequest({
    required Future<http.Response> request,
  }) {
    return TaskEither.tryCatch(
      () async {
        final response = await request.timeout(
          Duration(seconds: timeOutSeconds),
        );
        return _handleResponse(response: response);
      },
      _handleException,
    );
  }

  Map<String, dynamic> _handleResponse({
    required http.Response response,
  }) {
    final int statusCode = response.statusCode;
    final dynamic decodedBody = jsonDecode(response.body);

    final List<int> successfullStatusCodes = [
      HttpStatus.accepted,
      HttpStatus.ok,
      HttpStatus.created
    ];

    if (!successfullStatusCodes.contains(statusCode)) {
      throw BaseException(
        errorCode: statusCode,
        message: decodedBody['message'],
      );
    }

    if (decodedBody is List<dynamic>) {
      return {'data': decodedBody};
    } else if (decodedBody is Map<String, dynamic>) {
      return decodedBody;
    } else {
      throw BaseException(
          errorCode: 1,
          message: 'Unexpected Format on Network Service Response Handler');
    }
  }

  Exception _handleException(Object error, StackTrace stackTrace) {
    if (error is BaseException) {
      return error;
    } else if (error is SocketException) {
      return BaseException(
        errorCode: 000,
      );
    }

    return BaseException(errorCode: 1);
  }
}
