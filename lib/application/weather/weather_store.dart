import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:large_states_rebuilder/domain/geolocation/i_geolocation_facade.dart';
import 'package:large_states_rebuilder/domain/local_storage/i_local_storage_facade.dart';
import 'package:large_states_rebuilder/domain/local_storage/local_storage_failure.dart';
import 'package:large_states_rebuilder/domain/weather/i_weather_facade.dart';
import 'package:large_states_rebuilder/domain/weather/value_objects.dart';
import 'package:large_states_rebuilder/domain/weather/weather_entity.dart';
import 'package:large_states_rebuilder/domain/weather/weather_failure.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_state.dart';
part 'weather_store.freezed.dart';

/// Used by the reative model in by states_provider.
class WeatherStore {
  /// Holds a reference to `WeatherRepositoryFacade` in the infrastructure layer where the
  /// interface `IWeatherFacade` is implemented.
  final IWeatherFacade _weatherFacade;
  final IGeolocationFacade _geolocationFacade;
  final ILocalStorageFacade _localStorageFacade;
  WeatherStore(
    this._weatherFacade,
    this._geolocationFacade,
    this._localStorageFacade,
    this._weatherState,
  );

  WeatherState _weatherState;
  WeatherState get state => _weatherState;

  void newSearch() {
    _weatherState = state.copyWith(showErrorMessages: false);
  }

  void cityChanged({@required String cityStr}) {
    _weatherState = state.copyWith(
      city: City(cityStr),
      weatherFailureOrSuccessOption: none(),
    );
  }

  /// Fetches the weather for given [location]. It handles the
  /// updating of the [WeatherEntity] and delegates the
  /// updating of the theme to the `ThemeStore`.
  Stream<void> fetchWeatherForLocationWithQuery({
    @required String cityStr,
    @required DateTime requestTime,
  }) async* {
    final City _city = City(cityStr);
    if (cityStr.isEmpty) {
      yield _weatherState = state.copyWith(
        city: _city,
        showErrorMessages: true,
      );
    } else {
      final isCityValid = _city.isValid();

      if (isCityValid) {
        yield _weatherState = state.copyWith(
          city: _city,
          isLoading: true,
          weatherFailureOrSuccessOption: none(),
        );
      }
    }
    final Either<WeatherFailure, WeatherResponse> failureOrSuccess =
        await _weatherFacade.getWeatherWithQuery(city: _city);

    WeatherFailure _wf;
    WeatherResponse _wr;
    failureOrSuccess.fold((l) => {_wf = l}, (r) => {_wr = r});

    if (failureOrSuccess.isLeft()) {
      yield _weatherState = state.copyWith(
        city: _city,
        isLoading: false,
        showErrorMessages: true,
        weatherFailureOrSuccessOption: some(left(_wf)),
      );
    } else {
      final WeatherEntity _we = state.weatherEntity.copyWith(
        weatherResponse: some(_wr),
        lastUpdated: some(requestTime),
      );
      await _localStorageFacade.saveToLocalStorage(weatherEntity: _we);
      yield _weatherState = state.copyWith(
        city: _city,
        weatherEntity: _we,
        isLoading: false,
        showErrorMessages: true,
        weatherFailureOrSuccessOption: some(right(_wr)),
      );
    }
  }

  Stream<void> fetchWeatherForLocationWithLattLong({
    double latt,
    double long,
    @required DateTime requestTime,
  }) async* {
    yield _weatherState = state.copyWith(
      isLoading: true,
      weatherFailureOrSuccessOption: none(),
    );
    final Position _userPosition =
        await _geolocationFacade.getCurrentUserPosition();
    final Either<WeatherFailure, WeatherResponse> failureOrSuccess =
        await _weatherFacade.getWeatherWithLattLong(
      latt: _userPosition.latitude,
      long: _userPosition.longitude,
    );
    WeatherFailure _wf;
    WeatherResponse _wr;
    failureOrSuccess.fold((l) => {_wf = l}, (r) => {_wr = r});

    if (failureOrSuccess.isLeft()) {
      yield _weatherState = state.copyWith(
        isLoading: false,
        showErrorMessages: true,
        weatherFailureOrSuccessOption: some(left(_wf)),
      );
    } else {
      final WeatherEntity _we = state.weatherEntity.copyWith(
        weatherResponse: some(_wr),
        lastUpdated: some(requestTime),
      );
      await _localStorageFacade.saveToLocalStorage(weatherEntity: _we);
      final City _city = City(_we.weatherResponse.getOrElse(() => null).title);
      yield _weatherState = state.copyWith(
        city: _city,
        weatherEntity: _we,
        isLoading: false,
        showErrorMessages: true,
        weatherFailureOrSuccessOption: some(right(_wr)),
      );
    }
  }

  /// Refreshes the weather for given [location]. It handles the
  /// updating of the [WeatherEntity] and delegates the
  /// updating of the theme to the `ThemeStore`.
  Stream<WeatherState> refreshWeatherForLocation({
    @required String cityStr,
    @required DateTime requestTime,
  }) async* {
    final City _city = City(cityStr);
    if (cityStr.isEmpty) {
      yield _weatherState = state.copyWith(
        city: _city,
        showErrorMessages: true,
      );
    }
    final Either<WeatherFailure, WeatherResponse> failureOrSuccess =
        await _weatherFacade.getWeatherWithQuery(city: _city);

    WeatherFailure _wf;
    WeatherResponse _wr;
    failureOrSuccess.fold((l) => {_wf = l}, (r) => {_wr = r});

    if (failureOrSuccess.isLeft()) {
      yield _weatherState = state.copyWith(
        city: _city,
        isLoading: false,
        showErrorMessages: true,
        weatherFailureOrSuccessOption: some(left(_wf)),
      );
    } else {
      final WeatherEntity _we = state.weatherEntity.copyWith(
        weatherResponse: some(_wr),
        lastUpdated: some(requestTime),
      );
      await _localStorageFacade.saveToLocalStorage(weatherEntity: _we);
      yield _weatherState = state.copyWith(
        city: _city,
        weatherEntity: _we,
        isLoading: false,
        showErrorMessages: true,
        weatherFailureOrSuccessOption: some(right(_wr)),
      );
    }
  }

  Future<void> loadWeatherEntityFromStorage() async {
    final Either<LocalStorageFailure, WeatherEntity> failureOrSuccess =
        _localStorageFacade.loadWeatherDataFromLocalStorage();

    WeatherEntity _we;
    failureOrSuccess.fold((failure) => null, (success) => {_we = success});

    if (failureOrSuccess.isRight()) {
      final City _city = City(_we.weatherResponse.getOrElse(() => null).title);
      _weatherState = state.copyWith(
        city: _city,
        weatherEntity: _we,
        showErrorMessages: true,
        weatherFailureOrSuccessOption: some(
          right(
            _we.weatherResponse.getOrElse(() => null),
          ),
        ),
      );
    }
  }

  /// Returns the `WeatherCondition` for the current weather.
  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherState.weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }
}
