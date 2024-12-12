import 'package:logger/logger.dart';

final class LoggerService {
  static final Logger logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(),
    output: ConsoleOutput(),
    level: Level.all,
  );

  static void logError(Error error, StackTrace stackTrace, String? message) {
    logger.e(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
