import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:large_states_rebuilder/application/authentication/authentication_store.dart';
import 'package:large_states_rebuilder/domain/authentication/i_auth_facade.dart';
import 'package:large_states_rebuilder/infrastructure/logging/i_logging_facade.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:large_states_rebuilder/application/theme/theme_store.dart';
import 'package:large_states_rebuilder/domain/theme/theme_entity.dart';
import 'package:large_states_rebuilder/injection.dart';
import 'package:large_states_rebuilder/presentation/states_rebuilder_app.dart';
import 'package:fimber/fimber.dart';

import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialises the code generation for [get_it].
  await configureInjection(Environment.dev);
  const List<String> onlyError = ["E"];
  getIt<ILoggingFacade<FimberLog>>().initializeLogging(logLevels: onlyError);
  runApp(
    Injector(
      inject: [
        Inject<ThemeStore>(
          () => ThemeStore(
            getIt<ThemeEntity>(),
          ),
        ),
        Inject<AuthenticationStore>(
          () => AuthenticationStore(
              getIt<IAuthFacade>(), getIt<AuthenticationState>()),
        ),
      ],
      builder: (context) {
        return StatesRebuilderApp();
      },
    ),
  );
}
