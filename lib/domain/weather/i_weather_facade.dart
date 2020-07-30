import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:large_states_rebuilder/domain/weather/value_objects.dart';
import 'package:large_states_rebuilder/domain/weather/weather_failure.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Is an interface that specifies which methods are relevant to connect to the domain layer.
abstract class IWeatherFacade {
  /// Is an asynchronous method that returns `WeatherResponse` for a given [query].
  Future<Either<WeatherFailure, WeatherResponse>> getWeatherWithQuery(
      {@required City city});

  /// Is an asynchronous method that returns `WeatherResponse` for a given [lattitude] and [longitude].
  Future<Either<WeatherFailure, WeatherResponse>> getWeatherWithLattLong(
      {@required double latt, @required double long});

  /// Is an asynchonous method that return an updated `WeatherResponse` for a given [location]
  /// by making another request.
  Future<Either<WeatherFailure, WeatherResponse>> refreshWeatherData(
      {@required City city});

  /// Returns a `WeatherCondition` for a given [weather].
  WeatherCondition getWeatherConditionForWeather({@required Weather weather});
}
