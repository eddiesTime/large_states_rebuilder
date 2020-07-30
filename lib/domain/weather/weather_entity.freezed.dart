// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'weather_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WeatherEntityTearOff {
  const _$WeatherEntityTearOff();

// ignore: unused_element
  _WeatherEntity call(
      {@required UniqueId id,
      @required Option<WeatherResponse> weatherResponse,
      @required Option<DateTime> lastUpdated}) {
    return _WeatherEntity(
      id: id,
      weatherResponse: weatherResponse,
      lastUpdated: lastUpdated,
    );
  }
}

// ignore: unused_element
const $WeatherEntity = _$WeatherEntityTearOff();

mixin _$WeatherEntity {
  UniqueId get id;
  Option<WeatherResponse> get weatherResponse;
  Option<DateTime> get lastUpdated;

  $WeatherEntityCopyWith<WeatherEntity> get copyWith;
}

abstract class $WeatherEntityCopyWith<$Res> {
  factory $WeatherEntityCopyWith(
          WeatherEntity value, $Res Function(WeatherEntity) then) =
      _$WeatherEntityCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      Option<WeatherResponse> weatherResponse,
      Option<DateTime> lastUpdated});
}

class _$WeatherEntityCopyWithImpl<$Res>
    implements $WeatherEntityCopyWith<$Res> {
  _$WeatherEntityCopyWithImpl(this._value, this._then);

  final WeatherEntity _value;
  // ignore: unused_field
  final $Res Function(WeatherEntity) _then;

  @override
  $Res call({
    Object id = freezed,
    Object weatherResponse = freezed,
    Object lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      weatherResponse: weatherResponse == freezed
          ? _value.weatherResponse
          : weatherResponse as Option<WeatherResponse>,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated as Option<DateTime>,
    ));
  }
}

abstract class _$WeatherEntityCopyWith<$Res>
    implements $WeatherEntityCopyWith<$Res> {
  factory _$WeatherEntityCopyWith(
          _WeatherEntity value, $Res Function(_WeatherEntity) then) =
      __$WeatherEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      Option<WeatherResponse> weatherResponse,
      Option<DateTime> lastUpdated});
}

class __$WeatherEntityCopyWithImpl<$Res>
    extends _$WeatherEntityCopyWithImpl<$Res>
    implements _$WeatherEntityCopyWith<$Res> {
  __$WeatherEntityCopyWithImpl(
      _WeatherEntity _value, $Res Function(_WeatherEntity) _then)
      : super(_value, (v) => _then(v as _WeatherEntity));

  @override
  _WeatherEntity get _value => super._value as _WeatherEntity;

  @override
  $Res call({
    Object id = freezed,
    Object weatherResponse = freezed,
    Object lastUpdated = freezed,
  }) {
    return _then(_WeatherEntity(
      id: id == freezed ? _value.id : id as UniqueId,
      weatherResponse: weatherResponse == freezed
          ? _value.weatherResponse
          : weatherResponse as Option<WeatherResponse>,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated as Option<DateTime>,
    ));
  }
}

class _$_WeatherEntity with DiagnosticableTreeMixin implements _WeatherEntity {
  const _$_WeatherEntity(
      {@required this.id,
      @required this.weatherResponse,
      @required this.lastUpdated})
      : assert(id != null),
        assert(weatherResponse != null),
        assert(lastUpdated != null);

  @override
  final UniqueId id;
  @override
  final Option<WeatherResponse> weatherResponse;
  @override
  final Option<DateTime> lastUpdated;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherEntity(id: $id, weatherResponse: $weatherResponse, lastUpdated: $lastUpdated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('weatherResponse', weatherResponse))
      ..add(DiagnosticsProperty('lastUpdated', lastUpdated));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
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
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(weatherResponse) ^
      const DeepCollectionEquality().hash(lastUpdated);

  @override
  _$WeatherEntityCopyWith<_WeatherEntity> get copyWith =>
      __$WeatherEntityCopyWithImpl<_WeatherEntity>(this, _$identity);
}

abstract class _WeatherEntity implements WeatherEntity {
  const factory _WeatherEntity(
      {@required UniqueId id,
      @required Option<WeatherResponse> weatherResponse,
      @required Option<DateTime> lastUpdated}) = _$_WeatherEntity;

  @override
  UniqueId get id;
  @override
  Option<WeatherResponse> get weatherResponse;
  @override
  Option<DateTime> get lastUpdated;
  @override
  _$WeatherEntityCopyWith<_WeatherEntity> get copyWith;
}
