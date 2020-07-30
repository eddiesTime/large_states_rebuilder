import 'package:large_states_rebuilder/domain/weather/weather_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Weather Failure', () {
    setUp(() async {});

    test(
        'should check whether WeatherFailure.notALocation().toString() is working correctly',
        () {
      expect(const NotALocation().toString(), 'WeatherFailure.notALocation()');
    });
    test(
        'should check whether WeatherFailure.noLocationFoundForLattLong().toString() is working correctly',
        () {
      expect(const NoLocationFoundForLattLong().toString(),
          'WeatherFailure.noLocationFoundForLattLong()');
    });
    test(
        'should check whether WeatherFailure.unableToRefresh().toString() is working correctly',
        () {
      expect(const UnableToRefresh().toString(),
          'WeatherFailure.unableToRefresh()');
    });
  });
}
