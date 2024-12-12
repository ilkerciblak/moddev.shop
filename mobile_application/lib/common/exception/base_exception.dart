import 'package:mobile_application/common/service/logger/logger_service.dart';

final class BaseException implements Exception {
  final int errorCode;
  final String? message;
  final Error? error;
  final StackTrace? stackTrace;

  final Map<int, String> httpStatusMessages = {
    401: 'You need to authenticate before that',
    403: 'You do not have permisson to do that',
    0: 'Please check your internet connection',
    1: 'Something Unexpected Happened'
  };

  BaseException({
    required this.errorCode,
    this.message,
    this.error,
    this.stackTrace,
  }) {
    if (error != null && stackTrace != null) {
      LoggerService.logError(
        error!,
        stackTrace!,
        message,
      );
    }
  }

  @override
  String toString() {
    return message ?? httpStatusMessages[errorCode] ?? errorCode.toString();
  }
}
