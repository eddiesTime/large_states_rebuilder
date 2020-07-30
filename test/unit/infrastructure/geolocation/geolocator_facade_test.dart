import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:large_states_rebuilder/infrastructure/geolocation/geolocator_facade.dart';
import 'package:large_states_rebuilder/infrastructure/logging/fimber_facade.dart';
import 'package:large_states_rebuilder/infrastructure/logging/i_logging_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

GetIt sl = GetIt.instance;

class MockGeolocator extends Mock implements Geolocator {}

class MockGeolocationFacade extends Mock implements GeolocatorFacade {}

class MockLoggingFacade extends Mock implements ILoggingFacade<FimberLog> {}

void main() {
  sl.registerLazySingleton<ILoggingFacade<FimberLog>>(() => FimberFacade());
  group('Geolocator Facade', () {
    Geolocator _geolocator;
    GeolocatorFacade _geolocatorFacade;
    ILoggingFacade<FimberLog> _loggingfacade;
    setUp(() {
      _geolocator = MockGeolocator();
      _loggingfacade = MockLoggingFacade();
      _geolocatorFacade = GeolocatorFacade(_geolocator, _loggingfacade);
    });

    test('should check whether a position is returned for success case',
        () async {
      final Position _mockedPosition =
          Position(latitude: 42.0, longitude: 17.5);
      when(_geolocator.getCurrentPosition())
          .thenAnswer((_) async => _mockedPosition);
      expect(
          _geolocatorFacade.getCurrentUserPosition(), isA<Future<Position>>());
      expect(await _geolocatorFacade.getCurrentUserPosition(), isA<Position>());
      expect(await _geolocatorFacade.getCurrentUserPosition(), _mockedPosition);
      verify(_loggingfacade.createNamedLogger(name: 'Geolocation')).called(1);
    });
    test('should check whether a position is returned for failure case',
        () async {
      verify(_loggingfacade.createNamedLogger(name: 'Geolocation')).called(1);
      when(_geolocator.getCurrentPosition()).thenThrow(Exception());
      when(_loggingfacade.logError(
              logger: null, message: 'Get current user position'))
          .thenThrow(ArgumentError());
      expect(await _geolocatorFacade.getCurrentUserPosition(), isA<Position>());
      expect(await _geolocatorFacade.getCurrentUserPosition(),
          Position(mocked: true));
      expect(
          () => _loggingfacade.logError(
              logger: null, message: 'Get current user position'),
          throwsArgumentError);
    });
  });
}
