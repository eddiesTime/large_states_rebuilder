import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:dartz/dartz.dart';
import 'package:fimber/fimber.dart';
import 'package:large_states_rebuilder/domain/core/value_object.dart';
import 'package:large_states_rebuilder/domain/local_storage/local_storage_failure.dart';
import 'package:large_states_rebuilder/domain/weather/weather_entity.dart';
import 'package:large_states_rebuilder/infrastructure/local_storage/local_storage_facade.dart';
import 'package:large_states_rebuilder/infrastructure/logging/fimber_facade.dart';
import 'package:large_states_rebuilder/infrastructure/logging/i_logging_facade.dart';
import 'package:large_states_rebuilder/infrastructure/weather/weather_entity_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

GetIt sl = GetIt.instance;

class MockSharedPrefs extends Mock implements SharedPreferences {}

class MockLoggingFacade extends Mock implements ILoggingFacade<FimberLog> {}

class MockWeatherResponse extends Mock implements WeatherResponse {}

class MockWeatherEntityDto extends Mock implements WeatherEntityDto {
  static WeatherEntityDto fromJson() {
    return MockWeatherEntityDto();
  }

  // ignore: prefer_constructors_over_static_methods
  static MockWeatherEntityDto fromDomain() {
    return MockWeatherEntityDto();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sl.registerLazySingleton<ILoggingFacade<FimberLog>>(() => FimberFacade());
  group('Local Storage Facade', () {
    LocalStorageFacade _localStorageFacade;
    SharedPreferences _sharedPrefs;
    ILoggingFacade<FimberLog> _loggingFacade;
    WeatherResponse _mockResponse;
    WeatherEntity _mockEntity;
    final DateTime _mockDate = DateTime.now();
    final UniqueId _mockId = UniqueId();
    setUp(() async {
      _sharedPrefs = MockSharedPrefs();
      _loggingFacade = MockLoggingFacade();
      _localStorageFacade = LocalStorageFacade(_sharedPrefs, _loggingFacade);
      final String _mockResponseJsonString =
          await rootBundle.loadString('assets/query.json');
      final List<dynamic> _mockResponseJson =
          jsonDecode(_mockResponseJsonString) as List<dynamic>;
      _mockResponse = WeatherResponse.fromJson(
          _mockResponseJson.first as Map<String, dynamic>);
      _mockEntity = WeatherEntity(
          id: _mockId,
          lastUpdated: some(_mockDate),
          weatherResponse: some(_mockResponse));
    });

    test(
        'should check whether loadWeatherDataFromLocalStorage() works correctly for failure case',
        () async {
      verify(_loggingFacade.createNamedLogger(name: 'Local Storage')).called(1);
      when(_sharedPrefs.getString('latestWeatherEntity'))
          .thenThrow(Exception());
      when(_loggingFacade.logError(
              logger: null, message: 'Load data from local storage.'))
          .thenThrow(ArgumentError());
      expect(_localStorageFacade.loadWeatherDataFromLocalStorage(),
          const Left(NoDataStored()));
    });
    test(
        'should check whether loadWeatherDataFromLocalStorage() works correctly for success case',
        () async {
      verify(_loggingFacade.createNamedLogger(name: 'Local Storage')).called(1);
      final WeatherEntityDto _mockDto =
          WeatherEntityDto.fromDomain(_mockEntity);
      final String _jsonMockDto = jsonEncode(_mockDto.toJson());
      when(_sharedPrefs.getString('latestWeatherEntity'))
          .thenReturn(_jsonMockDto);
      expect(_localStorageFacade.loadWeatherDataFromLocalStorage(),
          Right(_mockDto.toDomain()));
    });

    test(
        'should check whether saveToLocalStorage() works correctly for failure case',
        () async {
      verify(_loggingFacade.createNamedLogger(name: 'Local Storage')).called(1);
      // verify(MockWeatherEntityDto.fromDomain()).called(1);
      when(_sharedPrefs.setString(
              'latestWeatherEntity', jsonEncode(MockWeatherEntityDto())))
          .thenThrow(Exception());
      when(_loggingFacade.logError(
              logger: null, message: 'Load data from local storage.'))
          .thenThrow(ArgumentError());
      expect(await _localStorageFacade.saveToLocalStorage(), isFalse);
    });

    test(
        'should check whether saveToLocalStorage() works correctly for success case when WeatherEntity parameter is valid',
        () async {
      verify(_loggingFacade.createNamedLogger(name: 'Local Storage')).called(1);
      // verify(MockWeatherEntityDto.fromDomain()).called(1);
      final WeatherEntityDto _weatherEntityDto =
          WeatherEntityDto.fromDomain(_mockEntity);
      when(
        _sharedPrefs.setString(
          'latestWeatherEntity',
          jsonEncode(_weatherEntityDto),
        ),
      ).thenAnswer((_) => Future.value(true));
      expect(
          await _localStorageFacade.saveToLocalStorage(
              weatherEntity: _mockEntity),
          isTrue);
    });
    test(
        'should check whether saveToLocalStorage() works correctly for success case when WeatherEntity parameter is invalid',
        () async {
      expect(await _localStorageFacade.saveToLocalStorage(), isFalse);
    });
  });
}
