final class BaseException implements Exception {
  final int errorCode;
  final String? message;

  final Map<int, String> httpStatusMessages = {
    401: 'You need to authenticate before that',
    403: 'You do not have permisson to do that',
  };

  BaseException({required this.errorCode, required this.message});

  @override
  String toString() {
    return httpStatusMessages[errorCode] ?? message ?? errorCode.toString();
  }
}
