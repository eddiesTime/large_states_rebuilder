import 'package:large_states_rebuilder/domain/weather/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_dto.freezed.dart';

@freezed
abstract class CityDto with _$CityDto {
  const factory CityDto({@required String city}) = _CityDto;

  factory CityDto.fromDomain(City city) {
    return CityDto(
      city: city.getOrCrash(),
    );
  }
}
