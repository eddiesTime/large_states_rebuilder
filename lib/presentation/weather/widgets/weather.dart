import 'dart:async';

import 'package:flutter/material.dart';
import 'package:large_states_rebuilder/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:large_states_rebuilder/presentation/weather/widgets/gradient_container.dart';
import 'package:large_states_rebuilder/presentation/weather/widgets/last_updated.dart';
import 'package:large_states_rebuilder/presentation/weather/widgets/location.dart';

import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart'
    as model;

/// This widget builds the content of the weather screen.
class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        key: const Key('__Weather_Page_Content__'), child: _buildUI(context));
  }

  Widget _buildUI(BuildContext context) {
    return Container();
    // Rebuilds the weather content whenever a new WeatherState is received.
    // return BlocConsumer<WeatherBloc, WeatherState>(
    //     listenWhen: (previous, current) =>
    //         previous.weatherEntity != current.weatherEntity,
    //     listener: (context, state) {
    //       state.weatherFailureOrSuccessOption.fold(
    //         () {},
    //         (either) {
    //           either.fold(
    //             (_) {},
    //             (_) {
    //               final model.Weather _weather = state
    //                   .weatherEntity.weatherResponse
    //                   .getOrElse(() => null)
    //                   .weatherCollection
    //                   .first;
    //               // Adds the ThemeEvent weatherChanged to the event stream when the WeatherState is loaded.
    //               context.bloc<ThemeBloc>().add(
    //                     ThemeEvent.weatherChanged(
    //                       _weather.mapConditionToWeatherCondition(
    //                           _weather.condition),
    //                     ),
    //                   );
    //             },
    //           );
    //           _refreshCompleter?.complete();
    //           _refreshCompleter = Completer();
    //         },
    //       );
    //     },
    //     builder: (context, state) {
    //       if (state.isLoading) {
    //         return _buildLoading();
    //       } else {
    //         return state.weatherFailureOrSuccessOption.fold(() {
    //           return _buildIdle();
    //         }, (either) {
    //           return either.fold(
    //             (failure) => _buildError(state),
    //             (_) => _buildWeather(context, state),
    //           );
    //         });
    //       }
    //     });
  }

//   Widget _buildWeather(BuildContext context, WeatherState state) {
//     return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
//       return GradientContainer(
//         key: const Key('__Gradient_Container__'),
//         color: themeState.themeEntity.materialColor,
//         child: RefreshIndicator(
//           key: const Key('__Refresh_Indicator__'),
//           onRefresh: () {
//             context.bloc<WeatherBloc>().add(
//                   WeatherEvent.refreshWeatherForLocation(
//                     cityStr: state.weatherEntity.weatherResponse
//                         .getOrElse(() => null)
//                         .title,
//                     requestTime: DateTime.now(),
//                   ),
//                 );
//             return _refreshCompleter.future;
//           },
//           child: ListView(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 100.0),
//                 child: Center(
//                   child: Location(
//                     key: const Key('__Location__'),
//                     location: state.weatherEntity.weatherResponse
//                         .getOrElse(() => null)
//                         .title,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: LastUpdated(
//                   key: const Key('__Last_Updated__'),
//                   dateTime:
//                       state.weatherEntity.lastUpdated.getOrElse(() => null),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 50.0),
//                 child: Center(
//                   child: CombinedWeatherTemperature(
//                       key: const Key('__Combined_Weather_Temperature__'),
//                       weatherResponse: state.weatherEntity.weatherResponse
//                           .getOrElse(() => null)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }

//   Widget _buildError(WeatherState state) {
//     return Center(
//       key: const Key('__Error__'),
//       child: state.weatherFailureOrSuccessOption.fold(
//         () => null,
//         (either) {
//           return either.fold((failure) {
//             return failure.map(
//               unableToRefresh: (_) => const Text(
//                 'Unable to refresh!',
//                 style: TextStyle(color: Colors.red),
//               ),
//               notALocation: (_) => const Text(
//                 'Not a location!',
//                 style: TextStyle(color: Colors.red),
//               ),
//               noLocationFoundForLattLong: (_) => const Text(
//                 'No location found for given location',
//                 style: TextStyle(color: Colors.red),
//               ),
//             );
//           }, (_) => null);
//         },
//       ),
//     );
//   }

//   Widget _buildLoading() {
//     return const Center(
//         child: CircularProgressIndicator(
//       key: Key('__Circular_Progress_Indicator__'),
//     ));
//   }

//   Widget _buildIdle() {
//     return const Center(
//         key: Key('__Idle__'), child: Text('Please Select a Location'));
//   }
}
