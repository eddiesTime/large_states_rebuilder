import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:fimber/fimber.dart';
import 'package:large_states_rebuilder/domain/weather/value_objects.dart';
import 'package:large_states_rebuilder/domain/weather/weather_failure.dart';
import 'package:large_states_rebuilder/infrastructure/logging/fimber_facade.dart';
import 'package:large_states_rebuilder/infrastructure/logging/i_logging_facade.dart';
import 'package:large_states_rebuilder/infrastructure/weather/city_dto.dart';
import 'package:large_states_rebuilder/infrastructure/weather/weather_repository_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

GetIt sl = GetIt.instance;

class MockLoggingFacade extends Mock implements ILoggingFacade<FimberLog> {}

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockWeather extends Mock implements Weather {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sl.registerLazySingleton<ILoggingFacade<FimberLog>>(() => FimberFacade());
  group('Weather Repository Facade', () {
    ILoggingFacade<FimberLog> _mockLoggingFacade;
    WeatherRepository _mockWeatherRepository;
    WeatherRepositoryFacade _weatherRepositoryFacade;
    WeatherResponse _mockQueryResponse;
    WeatherResponse _mockLatLongResponse;
    Weather _mockWeather;

    final City _mockCity = City('Foo');

    setUp(() async {
      _mockLoggingFacade = MockLoggingFacade();
      _mockWeatherRepository = MockWeatherRepository();
      _mockWeather = MockWeather();
      _weatherRepositoryFacade = WeatherRepositoryFacade(
        _mockWeatherRepository,
        _mockLoggingFacade,
      );
      final String _mockResponseJsonString =
          await rootBundle.loadString('assets/query.json');
      final List<dynamic> _mockResponseJson =
          jsonDecode(_mockResponseJsonString) as List<dynamic>;
      _mockQueryResponse = WeatherResponse.fromJson(
          _mockResponseJson.first as Map<String, dynamic>);
      final String _mockLatLongResponseJsonString =
          await rootBundle.loadString('assets/latlong.json');
      final List<dynamic> _mocklatlongResponseJson =
          jsonDecode(_mockLatLongResponseJsonString) as List<dynamic>;
      _mockLatLongResponse = WeatherResponse.fromJson(
          _mocklatlongResponseJson.first as Map<String, dynamic>);
    });

    test('check whether constructor is working correctly', () {
      verify(_mockLoggingFacade.createNamedLogger(name: 'Weather Repo'))
          .called(1);
    });
    // getWeatherConditionForWeather
    test(
        'check whether getWeatherConditionForWeather is working correctly for success case',
        () {
      when(_mockWeather.mapConditionToWeatherCondition(_mockWeather.condition))
          .thenReturn(WeatherCondition.clear);
      expect(
          _weatherRepositoryFacade.getWeatherConditionForWeather(
            weather: _mockWeather,
          ),
          WeatherCondition.clear);
    });
    test(
        'check whether getWeatherConditionForWeather is working correctly for failure case',
        () {
      when(_mockWeather.mapConditionToWeatherCondition(_mockWeather.condition))
          .thenThrow(const FormatException());
      when(
        _mockLoggingFacade.logError(
          logger: null,
          message: 'Get weather condition for weather $_mockWeather.',
        ),
      ).thenThrow(ArgumentError());
      expect(
          _weatherRepositoryFacade.getWeatherConditionForWeather(
            weather: _mockWeather,
          ),
          isNull);
      expect(
          () => _mockLoggingFacade.logError(
                logger: null,
                message: 'Get weather condition for weather $_mockWeather.',
              ),
          throwsArgumentError);
    });
    // getWeatherWithQuery
    test(
        'check whether getWeatherWithQuery is working correctly for success case',
        () async {
      final CityDto _mockDto = CityDto.fromDomain(_mockCity);
      when(_mockWeatherRepository.getWeatherWithQuery(city: _mockDto.city))
          .thenAnswer((_) => Future.value(_mockQueryResponse));
      expect(
          await _weatherRepositoryFacade.getWeatherWithQuery(city: _mockCity),
          right(_mockQueryResponse));
    });
    test(
        'check whether getWeatherWithQuery is working correctly for failure case',
        () async {
      when(_mockWeatherRepository.getWeatherWithQuery(city: 'Foo')).thenThrow(
        const FormatException(),
      );
      when(
        _mockLoggingFacade.logError(
          logger: null,
          message: 'Get weather for query.',
        ),
      ).thenThrow(ArgumentError());
      expect(
          () => _mockLoggingFacade.logError(
                logger: null,
                message: 'Get weather for query.',
              ),
          throwsArgumentError);
      expect(
        await _weatherRepositoryFacade.getWeatherWithQuery(city: _mockCity),
        left(const NotALocation()),
      );
    });
    // getWeatherWithLattLong
    test(
        'check whether getWeatherWithLattLong is working correctly for success case',
        () async {
      when(_mockWeatherRepository.getWeatherWithLattLong(
              latt: 42.0, long: 17.5))
          .thenAnswer((_) => Future.value(_mockLatLongResponse));
      expect(
          await _weatherRepositoryFacade.getWeatherWithLattLong(
              latt: 42.0, long: 17.5),
          right(_mockLatLongResponse));
    });
    test(
        'check whether getWeatherWithLattLong is working correctly for failure case',
        () async {
      when(_mockWeatherRepository.getWeatherWithLattLong(
              latt: 42.0, long: 17.5))
          .thenThrow(const FormatException());
      when(
        _mockLoggingFacade.logError(
          logger: null,
          message: 'Get weather with latlong',
        ),
      ).thenThrow(ArgumentError());
      expect(
          () => _mockLoggingFacade.logError(
                logger: null,
                message: 'Get weather with latlong',
              ),
          throwsArgumentError);
      expect(
          await _weatherRepositoryFacade.getWeatherWithLattLong(
              latt: 42.0, long: 17.5),
          left(const NoLocationFoundForLattLong()));
    });

    // refreshWeatherData
    test(
        'check whether refreshWeatherData is working correctly for success case',
        () async {
      final CityDto _mockDto = CityDto.fromDomain(_mockCity);
      when(_mockWeatherRepository.getWeatherWithQuery(city: _mockDto.city))
          .thenAnswer((_) => Future.value(_mockQueryResponse));
      expect(await _weatherRepositoryFacade.refreshWeatherData(city: _mockCity),
          right(_mockQueryResponse));
    });
    test(
        'check whether refreshWeatherData is working correctly for failure case',
        () async {
      when(_mockWeatherRepository.getWeatherWithQuery(city: 'Foo'))
          .thenThrow(const FormatException());
      when(
        _mockLoggingFacade.logError(
          logger: null,
          message: 'Refresh weather data.',
        ),
      ).thenThrow(ArgumentError());
      expect(
          () => _mockLoggingFacade.logError(
                logger: null,
                message: 'Refresh weather data.',
              ),
          throwsArgumentError);
      expect(await _weatherRepositoryFacade.refreshWeatherData(city: _mockCity),
          left(const UnableToRefresh()));
    });
  });
}
