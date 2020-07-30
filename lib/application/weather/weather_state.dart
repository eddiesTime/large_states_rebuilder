part of 'weather_store.dart';

/// An interface to specify weather states.
@lazySingleton
@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState({
    @required WeatherEntity weatherEntity,
    @required City city,
    @required bool showErrorMessages,
    @required bool isLoading,
    @required
        Option<Either<WeatherFailure, WeatherResponse>>
            weatherFailureOrSuccessOption,
  }) = _WeatherState;

  @factoryMethod
  factory WeatherState.initial() => WeatherState(
        weatherEntity: WeatherEntity.initial(),
        city: City(''),
        showErrorMessages: false,
        isLoading: false,
        weatherFailureOrSuccessOption: none(),
      );
}
