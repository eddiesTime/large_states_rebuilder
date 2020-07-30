// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'weather_entity_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
WeatherEntityDto _$WeatherEntityDtoFromJson(Map<String, dynamic> json) {
  return _WeatherEntityDto.fromJson(json);
}

class _$WeatherEntityDtoTearOff {
  const _$WeatherEntityDtoTearOff();

// ignore: unused_element
  _WeatherEntityDto call(
      {@required String idX,
      @required WeatherResponse weatherResponse,
      @required DateTime lastUpdated}) {
    return _WeatherEntityDto(
      idX: idX,
      weatherResponse: weatherResponse,
      lastUpdated: lastUpdated,
    );
  }
}

// ignore: unused_element
const $WeatherEntityDto = _$WeatherEntityDtoTearOff();

mixin _$WeatherEntityDto {
  String get idX;
  WeatherResponse get weatherResponse;
  DateTime get lastUpdated;

  Map<String, dynamic> toJson();
  $WeatherEntityDtoCopyWith<WeatherEntityDto> get copyWith;
}

abstract class $WeatherEntityDtoCopyWith<$Res> {
  factory $WeatherEntityDtoCopyWith(
          WeatherEntityDto value, $Res Function(WeatherEntityDto) then) =
      _$WeatherEntityDtoCopyWithImpl<$Res>;
  $Res call(
      {String idX, WeatherResponse weatherResponse, DateTime lastUpdated});

  $WeatherResponseCopyWith<$Res> get weatherResponse;
}

class _$WeatherEntityDtoCopyWithImpl<$Res>
    implements $WeatherEntityDtoCopyWith<$Res> {
  _$WeatherEntityDtoCopyWithImpl(this._value, this._then);

  final WeatherEntityDto _value;
  // ignore: unused_field
  final $Res Function(WeatherEntityDto) _then;

  @override
  $Res call({
    Object idX = freezed,
    Object weatherResponse = freezed,
    Object lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      idX: idX == freezed ? _value.idX : idX as String,
      weatherResponse: weatherResponse == freezed
          ? _value.weatherResponse
          : weatherResponse as WeatherResponse,
      lastUpdated:
          lastUpdated == freezed ? _value.lastUpdated : lastUpdated as DateTime,
    ));
  }

  @override
  $WeatherResponseCopyWith<$Res> get weatherResponse {
    if (_value.weatherResponse == null) {
      return null;
    }
    return $WeatherResponseCopyWith<$Res>(_value.weatherResponse, (value) {
      return _then(_value.copyWith(weatherResponse: value));
    });
  }
}

abstract class _$WeatherEntityDtoCopyWith<$Res>
    implements $WeatherEntityDtoCopyWith<$Res> {
  factory _$WeatherEntityDtoCopyWith(
          _WeatherEntityDto value, $Res Function(_WeatherEntityDto) then) =
      __$WeatherEntityDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String idX, WeatherResponse weatherResponse, DateTime lastUpdated});

  @override
  $WeatherResponseCopyWith<$Res> get weatherResponse;
}

class __$WeatherEntityDtoCopyWithImpl<$Res>
    extends _$WeatherEntityDtoCopyWithImpl<$Res>
    implements _$WeatherEntityDtoCopyWith<$Res> {
  __$WeatherEntityDtoCopyWithImpl(
      _WeatherEntityDto _value, $Res Function(_WeatherEntityDto) _then)
      : super(_value, (v) => _then(v as _WeatherEntityDto));

  @override
  _WeatherEntityDto get _value => super._value as _WeatherEntityDto;

  @override
  $Res call({
    Object idX = freezed,
    Object weatherResponse = freezed,
    Object lastUpdated = freezed,
  }) {
    return _then(_WeatherEntityDto(
      idX: idX == freezed ? _value.idX : idX as String,
      weatherResponse: weatherResponse == freezed
          ? _value.weatherResponse
          : weatherResponse as WeatherResponse,
      lastUpdated:
          lastUpdated == freezed ? _value.lastUpdated : lastUpdated as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_WeatherEntityDto implements _WeatherEntityDto {
  const _$_WeatherEntityDto(
      {@required this.idX,
      @required this.weatherResponse,
      @required this.lastUpdated})
      : assert(idX != null),
        assert(weatherResponse != null),
        assert(lastUpdated != null);

  factory _$_WeatherEntityDto.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherEntityDtoFromJson(json);

  @override
  final String idX;
  @override
  final WeatherResponse weatherResponse;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'WeatherEntityDto(idX: $idX, weatherResponse: $weatherResponse, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherEntityDto &&
            (identical(other.idX, idX) ||
                const DeepCollectionEquality().equals(other.idX, idX)) &&
            (identical(other.weatherResponse, weatherResponse) ||
                const DeepCollectionEquality()
                    .equals(other.weatherResponse, weatherResponse)) &&
            (identical(other.lastUpdated, lastUpdated) ||
                const DeepCollectionEquality()
                    .equals(other.lastUpdated, lastUpdated)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idX) ^
      const DeepCollectionEquality().hash(weatherResponse) ^
      const DeepCollectionEquality().hash(lastUpdated);

  @override
  _$WeatherEntityDtoCopyWith<_WeatherEntityDto> get copyWith =>
      __$WeatherEntityDtoCopyWithImpl<_WeatherEntityDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherEntityDtoToJson(this);
  }
}

abstract class _WeatherEntityDto implements WeatherEntityDto {
  const factory _WeatherEntityDto(
      {@required String idX,
      @required WeatherResponse weatherResponse,
      @required DateTime lastUpdated}) = _$_WeatherEntityDto;

  factory _WeatherEntityDto.fromJson(Map<String, dynamic> json) =
      _$_WeatherEntityDto.fromJson;

  @override
  String get idX;
  @override
  WeatherResponse get weatherResponse;
  @override
  DateTime get lastUpdated;
  @override
  _$WeatherEntityDtoCopyWith<_WeatherEntityDto> get copyWith;
}
