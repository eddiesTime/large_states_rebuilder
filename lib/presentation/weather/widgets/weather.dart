import 'dart:async';

import 'package:flutter/material.dart';
import 'package:large_states_rebuilder/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:large_states_rebuilder/presentation/weather/widgets/gradient_container.dart';
import 'package:large_states_rebuilder/presentation/weather/widgets/last_updated.dart';
import 'package:large_states_rebuilder/presentation/weather/widgets/location.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart'
    as model;

import 'package:large_states_rebuilder/application/weather/weather_store.dart';
import 'package:large_states_rebuilder/application/theme/theme_store.dart';

/// This widget builds the content of the weather screen.
class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;
  ReactiveModel<WeatherStore> _weatherReactiveModel;
  ReactiveModel<ThemeStore> _themeReactiveModel;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    _weatherReactiveModel = Injector.getAsReactive<WeatherStore>();
    _themeReactiveModel = Injector.getAsReactive<ThemeStore>();
    return Center(
        key: const Key('__Weather_Page_Content__'), child: _buildUI(context));
  }

  Widget _buildUI(BuildContext context) {
    // Rebuilds the weather content whenever a new WeatherState is received.
    return OnSetStateListener<WeatherStore>(
      observe: () => _weatherReactiveModel,
      onData: (context, _) {
        _weatherReactiveModel.state.state.weatherFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold(
              (_) {},
              (_) {
                final model.Weather _weather = _weatherReactiveModel
                    .state.state.weatherEntity.weatherResponse
                    .getOrElse(() => null)
                    .weatherCollection
                    .first;
                // Adds the ThemeEvent weatherChanged to the event stream when the WeatherState is loaded.
                _themeReactiveModel.setState(
                  (s) => s.mapWeatherConditionToTheme(
                    _weather.mapConditionToWeatherCondition(_weather.condition),
                  ),
                );
              },
            );
            _refreshCompleter?.complete();
            _refreshCompleter = Completer();
          },
        );
      },
      child: StateBuilder<WeatherStore>(
        observe: () => _weatherReactiveModel,
        builder: (context, _) {
          if (_weatherReactiveModel.state.state.isLoading) {
            return _buildLoading();
          } else {
            return _weatherReactiveModel
                .state.state.weatherFailureOrSuccessOption
                .fold(() {
              return _buildIdle();
            }, (either) {
              return either.fold(
                (failure) => _buildError(_weatherReactiveModel.state.state),
                (_) => _buildWeather(context),
              );
            });
          }
        },
      ),
    );
  }

  Widget _buildWeather(BuildContext context) {
    return StateBuilder<ThemeStore>(
        observe: () => _themeReactiveModel,
        builder: (context, themeState) {
          return GradientContainer(
            key: const Key('__Gradient_Container__'),
            color: _themeReactiveModel.state.themeEntity.materialColor,
            child: RefreshIndicator(
              key: const Key('__Refresh_Indicator__'),
              onRefresh: () {
                _weatherReactiveModel
                    .setState((s) => s.refreshWeatherForLocation(
                          cityStr: s.state.weatherEntity.weatherResponse
                              .getOrElse(() => null)
                              .title,
                          requestTime: DateTime.now(),
                        ));
                return _refreshCompleter.future;
              },
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: Location(
                        key: const Key('__Location__'),
                        location: _weatherReactiveModel
                            .state.state.weatherEntity.weatherResponse
                            .getOrElse(() => null)
                            .title,
                      ),
                    ),
                  ),
                  Center(
                    child: LastUpdated(
                      key: const Key('__Last_Updated__'),
                      dateTime: _weatherReactiveModel
                          .state.state.weatherEntity.lastUpdated
                          .getOrElse(() => null),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: CombinedWeatherTemperature(
                          key: const Key('__Combined_Weather_Temperature__'),
                          weatherResponse: _weatherReactiveModel
                              .state.state.weatherEntity.weatherResponse
                              .getOrElse(() => null)),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildError(WeatherState state) {
    return Center(
      key: const Key('__Error__'),
      child: state.weatherFailureOrSuccessOption.fold(
        () => null,
        (either) {
          return either.fold((failure) {
            return failure.map(
              unableToRefresh: (_) => const Text(
                'Unable to refresh!',
                style: TextStyle(color: Colors.red),
              ),
              notALocation: (_) => const Text(
                'Not a location!',
                style: TextStyle(color: Colors.red),
              ),
              noLocationFoundForLattLong: (_) => const Text(
                'No location found for given location',
                style: TextStyle(color: Colors.red),
              ),
            );
          }, (_) => null);
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
        child: CircularProgressIndicator(
      key: Key('__Circular_Progress_Indicator__'),
    ));
  }

  Widget _buildIdle() {
    return const Center(
        key: Key('__Idle__'), child: Text('Please Select a Location'));
  }
}
