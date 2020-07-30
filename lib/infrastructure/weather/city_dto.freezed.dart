// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'city_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CityDtoTearOff {
  const _$CityDtoTearOff();

// ignore: unused_element
  _CityDto call({@required String city}) {
    return _CityDto(
      city: city,
    );
  }
}

// ignore: unused_element
const $CityDto = _$CityDtoTearOff();

mixin _$CityDto {
  String get city;

  $CityDtoCopyWith<CityDto> get copyWith;
}

abstract class $CityDtoCopyWith<$Res> {
  factory $CityDtoCopyWith(CityDto value, $Res Function(CityDto) then) =
      _$CityDtoCopyWithImpl<$Res>;
  $Res call({String city});
}

class _$CityDtoCopyWithImpl<$Res> implements $CityDtoCopyWith<$Res> {
  _$CityDtoCopyWithImpl(this._value, this._then);

  final CityDto _value;
  // ignore: unused_field
  final $Res Function(CityDto) _then;

  @override
  $Res call({
    Object city = freezed,
  }) {
    return _then(_value.copyWith(
      city: city == freezed ? _value.city : city as String,
    ));
  }
}

abstract class _$CityDtoCopyWith<$Res> implements $CityDtoCopyWith<$Res> {
  factory _$CityDtoCopyWith(_CityDto value, $Res Function(_CityDto) then) =
      __$CityDtoCopyWithImpl<$Res>;
  @override
  $Res call({String city});
}

class __$CityDtoCopyWithImpl<$Res> extends _$CityDtoCopyWithImpl<$Res>
    implements _$CityDtoCopyWith<$Res> {
  __$CityDtoCopyWithImpl(_CityDto _value, $Res Function(_CityDto) _then)
      : super(_value, (v) => _then(v as _CityDto));

  @override
  _CityDto get _value => super._value as _CityDto;

  @override
  $Res call({
    Object city = freezed,
  }) {
    return _then(_CityDto(
      city: city == freezed ? _value.city : city as String,
    ));
  }
}

class _$_CityDto implements _CityDto {
  const _$_CityDto({@required this.city}) : assert(city != null);

  @override
  final String city;

  @override
  String toString() {
    return 'CityDto(city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CityDto &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(city);

  @override
  _$CityDtoCopyWith<_CityDto> get copyWith =>
      __$CityDtoCopyWithImpl<_CityDto>(this, _$identity);
}

abstract class _CityDto implements CityDto {
  const factory _CityDto({@required String city}) = _$_CityDto;

  @override
  String get city;
  @override
  _$CityDtoCopyWith<_CityDto> get copyWith;
}
