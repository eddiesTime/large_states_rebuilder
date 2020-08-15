import 'package:dartz/dartz.dart';
import 'package:large_states_rebuilder/domain/core/value_object.dart';
import 'package:large_states_rebuilder/domain/weather/weather_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:flutter/foundation.dart';

part 'weather_entity_dto.freezed.dart';
part 'weather_entity_dto.g.dart';

@freezed
abstract class WeatherEntityDto with _$WeatherEntityDto {
  const factory WeatherEntityDto({
    @required String idX,
    @required WeatherResponse weatherResponse,
    @required DateTime lastUpdated,
  }) = _WeatherEntityDto;

  factory WeatherEntityDto.fromDomain(WeatherEntity weatherEntity) {
    return WeatherEntityDto(
      idX: weatherEntity.id.getOrCrash(),
      weatherResponse: weatherEntity.weatherResponse.getOrElse(() => null),
      lastUpdated: weatherEntity.lastUpdated.getOrElse(() => null),
    );
  }

  factory WeatherEntityDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityDtoFromJson(json);
}

extension WeatherEntityDtoX on WeatherEntityDto {
  WeatherEntity toDomain() {
    return WeatherEntity(
      id: UniqueId.fromUniqueString(idX),
      weatherResponse: some(weatherResponse),
      lastUpdated: some(lastUpdated),
    );
  }
}
