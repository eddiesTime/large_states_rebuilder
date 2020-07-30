import 'package:geolocator/geolocator.dart';

/// Is an interface that specifies which methods are relevant to connect to the domain layer.
abstract class IGeolocationFacade {
  Future<Position> getCurrentUserPosition();
}
