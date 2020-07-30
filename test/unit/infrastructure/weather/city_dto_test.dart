import 'package:large_states_rebuilder/domain/weather/value_objects.dart';
import 'package:large_states_rebuilder/infrastructure/weather/city_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('City Dto', () {
    setUp(() {});
    test('should check whether the factory constructor is working correctly',
        () {
      expect(const CityDto(city: 'Foo').toString(), 'CityDto(city: Foo)');
    });
    test(
        'should check whether the factory constructor CityDto.fromDomain is working correctly for valid City ValueObject',
        () {
      final City _city = City('Foo');
      expect(CityDto.fromDomain(_city), isA<CityDto>());
      expect(CityDto.fromDomain(_city).city, 'Foo');
    });
  });
}
