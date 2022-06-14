import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class LoggerModule {
  @singleton
  Logger get logger => Logger(
        printer: PrettyPrinter(
          printTime: true, // Should each log print contain a timestamp
        ),
      );
}
