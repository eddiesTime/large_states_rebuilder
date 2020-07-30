import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

import 'package:large_states_rebuilder/application/settings/settings_store.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final double low;
  final double high;

  const Temperature(this.temperature, this.low, this.high, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReactiveModel<SettingsStore> _reactiveModel =
        Injector.getAsReactive<SettingsStore>();
    return StateBuilder<SettingsStore>(
      observe: () => _reactiveModel,
      builder: (context, _) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                _reactiveModel.state.settingsEntity.temperatureUnit ==
                        TemperatureUnit.celsius
                    ? '${_formattedTemperature(_reactiveModel.state.settingsEntity.temperatureUnit, temperature)}°C'
                    : '${_formattedTemperature(_reactiveModel.state.settingsEntity.temperatureUnit, temperature)}°F',
                key: const Key('__Temperature_Text__'),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  _reactiveModel.state.settingsEntity.temperatureUnit ==
                          TemperatureUnit.celsius
                      ? 'min ${_formattedTemperature(_reactiveModel.state.settingsEntity.temperatureUnit, low)}°C'
                      : 'min ${_formattedTemperature(_reactiveModel.state.settingsEntity.temperatureUnit, low)}°F',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _reactiveModel.state.settingsEntity.temperatureUnit ==
                          TemperatureUnit.celsius
                      ? 'max ${_formattedTemperature(_reactiveModel.state.settingsEntity.temperatureUnit, high)}°C'
                      : 'max ${_formattedTemperature(_reactiveModel.state.settingsEntity.temperatureUnit, high)}°F',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }

  int _formattedTemperature(TemperatureUnit temperatureUnit, double t) {
    if (temperatureUnit == TemperatureUnit.fahrenheit) {
      final int fTemp = ((t * 9 / 5) + 32).round();
      return fTemp;
    }
    return t.round();
  }
}
