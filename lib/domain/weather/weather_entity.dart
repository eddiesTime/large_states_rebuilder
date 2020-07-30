import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:large_states_rebuilder/domain/core/entity.dart';
import 'package:large_states_rebuilder/domain/core/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_entity.freezed.dart';

/// Is a domain specific model which holds the apps weather relevant data.
@lazySingleton
@freezed
abstract class WeatherEntity with _$WeatherEntity implements IEntity {
  const factory WeatherEntity({
    @required UniqueId id,
    @required Option<WeatherResponse> weatherResponse,
    @required Option<DateTime> lastUpdated,
  }) = _WeatherEntity;

  /// Is a `WeatherEntity` which represents the initial state of the entity.
  @factoryMethod
  factory WeatherEntity.initial() => WeatherEntity(
        id: UniqueId(),
        weatherResponse: none(),
        lastUpdated: none(),
      );
}
