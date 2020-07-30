import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final double low;
  final double high;

  const Temperature(this.temperature, this.low, this.high, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
    //   return Row(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(right: 20.0),
    //         child: Text(
    //           state.temperatureUnit == TemperatureUnit.celsius
    //               ? '${_formattedTemperature(state.temperatureUnit, temperature)}°C'
    //               : '${_formattedTemperature(state.temperatureUnit, temperature)}°F',
    //           key: const Key('__Temperature_Text__'),
    //           style: const TextStyle(
    //             fontSize: 32,
    //             fontWeight: FontWeight.w600,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),
    //       Column(
    //         children: [
    //           Text(
    //             state.temperatureUnit == TemperatureUnit.celsius
    //                 ? 'min ${_formattedTemperature(state.temperatureUnit, low)}°C'
    //                 : 'min ${_formattedTemperature(state.temperatureUnit, low)}°F',
    //             style: const TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.w100,
    //               color: Colors.white,
    //             ),
    //           ),
    //           Text(
    //             state.temperatureUnit == TemperatureUnit.celsius
    //                 ? 'max ${_formattedTemperature(state.temperatureUnit, high)}°C'
    //                 : 'max ${_formattedTemperature(state.temperatureUnit, high)}°F',
    //             style: const TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.w100,
    //               color: Colors.white,
    //             ),
    //           )
    //         ],
    //       )
    //     ],
    //   );
    // },
    // );
  }

  int _formattedTemperature(TemperatureUnit temperatureUnit, double t) {
    if (temperatureUnit == TemperatureUnit.fahrenheit) {
      final int fTemp = ((t * 9 / 5) + 32).round();
      return fTemp;
    }
    return t.round();
  }
}
