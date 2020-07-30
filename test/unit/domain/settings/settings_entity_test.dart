import 'package:large_states_rebuilder/domain/settings/settings_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

void main() {
  group('Settings Entity', () {
    test('should check if the factory method is working correctly', () {
      const SettingsEntity _settingsEntity =
          SettingsEntity(temperatureUnit: TemperatureUnit.celsius);
      expect(_settingsEntity.temperatureUnit, TemperatureUnit.celsius);
    });
    test(
        'should check if the factory method SettingsEntity.celsius() is creating the correct object',
        () {
      final SettingsEntity _celsius = SettingsEntity.celsius();
      expect(_celsius.temperatureUnit, TemperatureUnit.celsius);
    });
    test(
        'should check if the factory method SettingsEntity.fahrenheit() is creating the correct object',
        () {
      final SettingsEntity _fahrenheit = SettingsEntity.fahrenheit();
      expect(_fahrenheit.temperatureUnit, TemperatureUnit.fahrenheit);
    });
  });
}
