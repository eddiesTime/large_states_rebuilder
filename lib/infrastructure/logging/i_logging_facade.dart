import 'package:flutter/foundation.dart';

abstract class ILoggingFacade<T> {
  void initializeLogging({List<String> logLevels});
  T createNamedLogger({@required String name});
  void logError({
    @required T logger,
    @required String message,
    dynamic exception,
    StackTrace stackTrace,
  });
  void logWarning({
    @required T logger,
    @required String message,
    dynamic exception,
    StackTrace stackTrace,
  });
  void logDebug({
    @required T logger,
    @required String message,
    dynamic exception,
    StackTrace stackTrace,
  });
  void logVerbose({
    @required T logger,
    @required String message,
    dynamic exception,
    StackTrace stackTrace,
  });
  void logInfo({
    @required T logger,
    @required String message,
    dynamic exception,
    StackTrace stackTrace,
  });
}
