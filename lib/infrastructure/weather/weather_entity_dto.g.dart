// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherEntityDto _$_$_WeatherEntityDtoFromJson(Map<String, dynamic> json) {
  return _$_WeatherEntityDto(
    idX: json['idX'] as String,
    weatherResponse: json['weatherResponse'] == null
        ? null
        : WeatherResponse.fromJson(
            json['weatherResponse'] as Map<String, dynamic>),
    lastUpdated: json['lastUpdated'] == null
        ? null
        : DateTime.parse(json['lastUpdated'] as String),
  );
}

Map<String, dynamic> _$_$_WeatherEntityDtoToJson(
        _$_WeatherEntityDto instance) =>
    <String, dynamic>{
      'idX': instance.idX,
      'weatherResponse': instance.weatherResponse,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };
