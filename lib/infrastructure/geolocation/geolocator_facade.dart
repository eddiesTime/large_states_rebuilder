import 'package:large_states_rebuilder/domain/geolocation/i_geolocation_facade.dart';
import 'package:large_states_rebuilder/infrastructure/logging/i_logging_facade.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:fimber/fimber.dart';

@LazySingleton(as: IGeolocationFacade)
class GeolocatorFacade implements IGeolocationFacade {
  final Geolocator _geolocator;
  final ILoggingFacade<FimberLog> _loggingFacade;
  FimberLog _logger;

  GeolocatorFacade(this._geolocator, this._loggingFacade) {
    _logger = _loggingFacade.createNamedLogger(name: 'Geolocation');
  }

  @override
  Future<Position> getCurrentUserPosition() {
    try {
      return _geolocator.getCurrentPosition();
    } catch (e, s) {
      _loggingFacade.logError(
          logger: _logger,
          message: 'Get current user position',
          exception: e,
          stackTrace: s);
      return Future.value(Position(mocked: true));
    }
  }
}
