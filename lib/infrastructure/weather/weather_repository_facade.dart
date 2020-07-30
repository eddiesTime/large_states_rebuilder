import 'package:dartz/dartz.dart';
import 'package:large_states_rebuilder/domain/weather/i_weather_facade.dart';
import 'package:large_states_rebuilder/domain/weather/value_objects.dart';
import 'package:large_states_rebuilder/domain/weather/weather_failure.dart';
import 'package:large_states_rebuilder/infrastructure/logging/i_logging_facade.dart';
import 'package:large_states_rebuilder/infrastructure/weather/city_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:weather_repository_core/weather_repository_core.dart';
import 'package:fimber/fimber.dart';

/// Implements the interface `WeatherFacade` provided by the domain layer.
///
/// It takes in a [WeatherRepository] which is used to request weather data.
@LazySingleton(as: IWeatherFacade)
class WeatherRepositoryFacade implements IWeatherFacade {
  final WeatherRepository _weatherRepository;
  final ILoggingFacade<FimberLog> _loggingFacade;
  FimberLog _logger;

  WeatherRepositoryFacade(this._weatherRepository, this._loggingFacade) {
    _logger = _loggingFacade.createNamedLogger(name: 'Weather Repo');
  }

  @override
  WeatherCondition getWeatherConditionForWeather({Weather weather}) {
    try {
      return weather.mapConditionToWeatherCondition(weather.condition);
    } catch (e, s) {
      _loggingFacade.logError(
          logger: _logger,
          message: 'Get weather condition for weather $weather.',
          exception: e,
          stackTrace: s);
      return null;
    }
  }

  @override
  Future<Either<WeatherFailure, WeatherResponse>> getWeatherWithQuery(
      {@required City city}) async {
    try {
      final CityDto cityDto = CityDto.fromDomain(city);
      final WeatherResponse _wr =
          await _weatherRepository.getWeatherWithQuery(city: cityDto.city);
      return right(_wr);
    } catch (e, s) {
      _loggingFacade.logError(
          logger: _logger,
          message: 'Get weather for query.',
          exception: e,
          stackTrace: s);
      return left(const NotALocation());
    }
  }

  @override
  Future<Either<WeatherFailure, WeatherResponse>> getWeatherWithLattLong({
    @required double latt,
    @required double long,
  }) async {
    try {
      final WeatherResponse _wr = await _weatherRepository
          .getWeatherWithLattLong(latt: latt, long: long);
      return right(_wr);
    } catch (e, s) {
      _loggingFacade.logError(
          logger: _logger,
          message: 'Get weather with latlong',
          exception: e,
          stackTrace: s);
      return left(const NoLocationFoundForLattLong());
    }
  }

  @override
  Future<Either<WeatherFailure, WeatherResponse>> refreshWeatherData(
      {@required City city}) async {
    try {
      final CityDto cityDto = CityDto.fromDomain(city);
      final WeatherResponse _wr =
          await _weatherRepository.getWeatherWithQuery(city: cityDto.city);
      return right(_wr);
    } catch (e, s) {
      _loggingFacade.logError(
          logger: _logger,
          message: 'Refresh weather data.',
          exception: e,
          stackTrace: s);
      return left(const UnableToRefresh());
    }
  }
}
