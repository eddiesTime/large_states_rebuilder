import 'package:large_states_rebuilder/infrastructure/logging/i_logging_facade.dart';
import 'package:injectable/injectable.dart';
import 'package:fimber/fimber.dart';

@dev
@LazySingleton(as: ILoggingFacade)
class FimberFacade implements ILoggingFacade<FimberLog> {
  @override
  FimberLog createNamedLogger({String name}) {
    return FimberLog(name);
  }

  @override
  void initializeLogging({List<String> logLevels}) {
    if (logLevels == null) {
      Fimber.plantTree(
        DebugTree(
          useColors: true,
        ),
      );
    } else {
      Fimber.plantTree(
        DebugTree(
          useColors: true,
          logLevels: logLevels,
        ),
      );
    }
  }

  @override
  void logDebug(
      {FimberLog logger,
      String message,
      dynamic exception,
      StackTrace stackTrace}) {
    logger.d(message);
  }

  @override
  void logError(
      {FimberLog logger,
      String message,
      dynamic exception,
      StackTrace stackTrace}) {
    logger.e(message, ex: exception, stacktrace: stackTrace);
  }

  @override
  void logInfo(
      {FimberLog logger,
      String message,
      dynamic exception,
      StackTrace stackTrace}) {
    logger.i(message);
  }

  @override
  void logVerbose(
      {FimberLog logger,
      String message,
      dynamic exception,
      StackTrace stackTrace}) {
    logger.v(message);
  }

  @override
  void logWarning(
      {FimberLog logger,
      String message,
      dynamic exception,
      StackTrace stackTrace}) {
    logger.w(message);
  }
}
