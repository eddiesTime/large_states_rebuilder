// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'weather_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WeatherStateTearOff {
  const _$WeatherStateTearOff();

// ignore: unused_element
  _WeatherState call(
      {@required
          WeatherEntity weatherEntity,
      @required
          City city,
      @required
          bool showErrorMessages,
      @required
          bool isLoading,
      @required
          Option<Either<WeatherFailure, WeatherResponse>>
              weatherFailureOrSuccessOption}) {
    return _WeatherState(
      weatherEntity: weatherEntity,
      city: city,
      showErrorMessages: showErrorMessages,
      isLoading: isLoading,
      weatherFailureOrSuccessOption: weatherFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $WeatherState = _$WeatherStateTearOff();

mixin _$WeatherState {
  WeatherEntity get weatherEntity;
  City get city;
  bool get showErrorMessages;
  bool get isLoading;
  Option<Either<WeatherFailure, WeatherResponse>>
      get weatherFailureOrSuccessOption;

  $WeatherStateCopyWith<WeatherState> get copyWith;
}

abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res>;
  $Res call(
      {WeatherEntity weatherEntity,
      City city,
      bool showErrorMessages,
      bool isLoading,
      Option<Either<WeatherFailure, WeatherResponse>>
          weatherFailureOrSuccessOption});

  $WeatherEntityCopyWith<$Res> get weatherEntity;
}

class _$WeatherStateCopyWithImpl<$Res> implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final WeatherState _value;
  // ignore: unused_field
  final $Res Function(WeatherState) _then;

  @override
  $Res call({
    Object weatherEntity = freezed,
    Object city = freezed,
    Object showErrorMessages = freezed,
    Object isLoading = freezed,
    Object weatherFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      weatherEntity: weatherEntity == freezed
          ? _value.weatherEntity
          : weatherEntity as WeatherEntity,
      city: city == freezed ? _value.city : city as City,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      weatherFailureOrSuccessOption: weatherFailureOrSuccessOption == freezed
          ? _value.weatherFailureOrSuccessOption
          : weatherFailureOrSuccessOption
              as Option<Either<WeatherFailure, WeatherResponse>>,
    ));
  }

  @override
  $WeatherEntityCopyWith<$Res> get weatherEntity {
    if (_value.weatherEntity == null) {
      return null;
    }
    return $WeatherEntityCopyWith<$Res>(_value.weatherEntity, (value) {
      return _then(_value.copyWith(weatherEntity: value));
    });
  }
}

abstract class _$WeatherStateCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$WeatherStateCopyWith(
          _WeatherState value, $Res Function(_WeatherState) then) =
      __$WeatherStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {WeatherEntity weatherEntity,
      City city,
      bool showErrorMessages,
      bool isLoading,
      Option<Either<WeatherFailure, WeatherResponse>>
          weatherFailureOrSuccessOption});

  @override
  $WeatherEntityCopyWith<$Res> get weatherEntity;
}

class __$WeatherStateCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherStateCopyWith<$Res> {
  __$WeatherStateCopyWithImpl(
      _WeatherState _value, $Res Function(_WeatherState) _then)
      : super(_value, (v) => _then(v as _WeatherState));

  @override
  _WeatherState get _value => super._value as _WeatherState;

  @override
  $Res call({
    Object weatherEntity = freezed,
    Object city = freezed,
    Object showErrorMessages = freezed,
    Object isLoading = freezed,
    Object weatherFailureOrSuccessOption = freezed,
  }) {
    return _then(_WeatherState(
      weatherEntity: weatherEntity == freezed
          ? _value.weatherEntity
          : weatherEntity as WeatherEntity,
      city: city == freezed ? _value.city : city as City,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      weatherFailureOrSuccessOption: weatherFailureOrSuccessOption == freezed
          ? _value.weatherFailureOrSuccessOption
          : weatherFailureOrSuccessOption
              as Option<Either<WeatherFailure, WeatherResponse>>,
    ));
  }
}

class _$_WeatherState implements _WeatherState {
  const _$_WeatherState(
      {@required this.weatherEntity,
      @required this.city,
      @required this.showErrorMessages,
      @required this.isLoading,
      @required this.weatherFailureOrSuccessOption})
      : assert(weatherEntity != null),
        assert(city != null),
        assert(showErrorMessages != null),
        assert(isLoading != null),
        assert(weatherFailureOrSuccessOption != null);

  @override
  final WeatherEntity weatherEntity;
  @override
  final City city;
  @override
  final bool showErrorMessages;
  @override
  final bool isLoading;
  @override
  final Option<Either<WeatherFailure, WeatherResponse>>
      weatherFailureOrSuccessOption;

  @override
  String toString() {
    return 'WeatherState(weatherEntity: $weatherEntity, city: $city, showErrorMessages: $showErrorMessages, isLoading: $isLoading, weatherFailureOrSuccessOption: $weatherFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherState &&
            (identical(other.weatherEntity, weatherEntity) ||
                const DeepCollectionEquality()
                    .equals(other.weatherEntity, weatherEntity)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.weatherFailureOrSuccessOption,
                    weatherFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.weatherFailureOrSuccessOption,
                    weatherFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(weatherEntity) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(weatherFailureOrSuccessOption);

  @override
  _$WeatherStateCopyWith<_WeatherState> get copyWith =>
      __$WeatherStateCopyWithImpl<_WeatherState>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {@required
          WeatherEntity weatherEntity,
      @required
          City city,
      @required
          bool showErrorMessages,
      @required
          bool isLoading,
      @required
          Option<Either<WeatherFailure, WeatherResponse>>
              weatherFailureOrSuccessOption}) = _$_WeatherState;

  @override
  WeatherEntity get weatherEntity;
  @override
  City get city;
  @override
  bool get showErrorMessages;
  @override
  bool get isLoading;
  @override
  Option<Either<WeatherFailure, WeatherResponse>>
      get weatherFailureOrSuccessOption;
  @override
  _$WeatherStateCopyWith<_WeatherState> get copyWith;
}
