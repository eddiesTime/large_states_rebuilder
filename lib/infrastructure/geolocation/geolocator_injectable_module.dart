import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GeolocatorInjectableModule {
  @lazySingleton
  Geolocator get geolocator => Geolocator();
}
