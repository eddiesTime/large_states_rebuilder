import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:large_states_rebuilder/domain/core/value_object.dart';
import 'package:large_states_rebuilder/domain/weather/weather_entity.dart';

import 'package:large_states_rebuilder/infrastructure/weather/weather_entity_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Weather Entity Dto', () {
    WeatherResponse _weatherResponse;
    final DateTime _mockDate = DateTime.now();
    final UniqueId _mockId = UniqueId();
    WeatherEntity _mockEntity;
    setUp(() async {
      final String _mockResponseJsonString =
          await rootBundle.loadString('assets/query.json');
      final List<dynamic> _mockResponseJson =
          jsonDecode(_mockResponseJsonString) as List<dynamic>;
      _weatherResponse = WeatherResponse.fromJson(
          _mockResponseJson.first as Map<String, dynamic>);
      _mockEntity = WeatherEntity(
          id: _mockId,
          weatherResponse: some(_weatherResponse),
          lastUpdated: some(_mockDate));
    });

    test('should check whether factory constructor is working correctly', () {
      final WeatherEntityDto _weatherEntityDto = WeatherEntityDto(
          idX: '123',
          weatherResponse: _weatherResponse,
          lastUpdated: _mockDate);
      expect(_weatherEntityDto, isA<WeatherEntityDto>());
      expect(_weatherEntityDto.idX, '123');
      expect(_weatherEntityDto.weatherResponse, _weatherResponse);
      expect(_weatherEntityDto.lastUpdated, _mockDate);
    });
    test(
        'should check whether factory method fromDomain() is working correctly',
        () {
      final WeatherEntityDto _mockDto =
          WeatherEntityDto.fromDomain(_mockEntity);
      expect(_mockDto, isA<WeatherEntityDto>());
      expect(_mockDto.idX, _mockId.getOrCrash());
      expect(_mockDto.weatherResponse, _weatherResponse);
      expect(_mockDto.lastUpdated, _mockDate);
    });
    test('should check whether factory method fromJson() is working correctly',
        () {
      final WeatherEntityDto _mockDto =
          WeatherEntityDto.fromDomain(_mockEntity);
      final jsonString = jsonEncode(_mockDto);
      final Map<String, dynamic> _mockJson =
          jsonDecode(jsonString) as Map<String, dynamic>;
      final WeatherEntityDto _fromJsonDto =
          WeatherEntityDto.fromJson(_mockJson);
      expect(_fromJsonDto, isA<WeatherEntityDto>());
      expect(_fromJsonDto.idX, _mockDto.idX);
      expect(_fromJsonDto.weatherResponse, _mockDto.weatherResponse);
      expect(_fromJsonDto.lastUpdated, _mockDto.lastUpdated);
    });

    test(
        'should check whether extension method toDomain() is working correctly',
        () {
      final WeatherEntityDto _mockDto =
          WeatherEntityDto.fromDomain(_mockEntity);
      final WeatherEntity _toDomainEntity = _mockDto.toDomain();
      expect(_toDomainEntity, isA<WeatherEntity>());
      expect(_toDomainEntity.id, _mockEntity.id);
      expect(_toDomainEntity.weatherResponse, _mockEntity.weatherResponse);
      expect(_toDomainEntity.lastUpdated, _mockEntity.lastUpdated);
    });
  });
}
