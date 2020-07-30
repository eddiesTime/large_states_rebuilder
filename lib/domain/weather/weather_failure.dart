import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_failure.freezed.dart';

@freezed
abstract class WeatherFailure with _$WeatherFailure {
  const factory WeatherFailure.notALocation() = NotALocation;
  const factory WeatherFailure.noLocationFoundForLattLong() =
      NoLocationFoundForLattLong;
  const factory WeatherFailure.unableToRefresh() = UnableToRefresh;
}
