import 'package:large_states_rebuilder/domain/weather/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Weather Value Objects', () {
    setUp(() async {});

    test('should check whether factory constructor city is working correctly',
        () {
      final City _mockCity = City('Foo');
      expect(City('Foo'), _mockCity);
    });
    test(
        'should check whether factory constructor city is throwing an AssertionError for null value',
        () {
      expect(() => City(null), throwsAssertionError);
    });
  });
}
