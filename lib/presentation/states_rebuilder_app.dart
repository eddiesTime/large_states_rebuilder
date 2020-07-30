import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:large_states_rebuilder/domain/geolocation/i_geolocation_facade.dart';
import 'package:large_states_rebuilder/domain/local_storage/i_local_storage_facade.dart';
import 'package:large_states_rebuilder/injection.dart';
import 'package:large_states_rebuilder/presentation/routes/router.dart';
import 'package:large_states_rebuilder/application/theme/theme_store.dart';
import 'package:large_states_rebuilder/application/weather/weather_store.dart';
import 'package:large_states_rebuilder/application/settings/settings_store.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'package:large_states_rebuilder/domain/weather/i_weather_facade.dart';
import 'package:large_states_rebuilder/domain/settings/settings_entity.dart';

class StatesRebuilderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Rebuilds the MaterialApp whenever the ThemeState changes.
    final ReactiveModel<ThemeStore> _themeStore =
        Injector.getAsReactive<ThemeStore>();
    return Injector(
      inject: [
        Inject<WeatherStore>(
          () => WeatherStore(
            getIt<IWeatherFacade>(),
            getIt<IGeolocationFacade>(),
            getIt<ILocalStorageFacade>(),
            getIt<WeatherState>(),
          ),
        ),
        Inject<SettingsStore>(
          () => SettingsStore(
            getIt<SettingsEntity>(),
          ),
        )
      ],
      builder: (context) => StateBuilder<ThemeStore>(
          observe: () => _themeStore,
          builder: (context, _) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: _themeStore.state.themeEntity.themeData,
              builder: ExtendedNavigator<Router>(
                router: Router(),
              ),
            );
          }),
    );
    // return BlocBuilder<ThemeBloc, ThemeState>(
    //   builder: (context, themeState) {
    //     return MultiBlocProvider(
    //         providers: [
    //           BlocProvider<WeatherBloc>(
    //             create: (_) => getIt<WeatherBloc>()
    //               ..add(
    //                 const LoadFromStorage(),
    //               ),
    //           ),
    //           BlocProvider<SettingsBloc>(
    //             create: (context) => getIt<SettingsBloc>(),
    //           )
    //         ],
    //         child: MaterialApp(
    //           builder: ExtendedNavigator<Router>(
    //             router: Router(),
    //           ),
    //           title: 'Flutter Demo',
    //           theme: themeState.themeEntity.themeData,
    //         ));
    //   },
    // );
  }
}
