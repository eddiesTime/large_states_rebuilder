// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/get_it_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

import 'application/authentication/authentication_store.dart';
import 'application/authentication/sign_in_form/sign_in_form_store.dart';
import 'application/weather/weather_store.dart';
import 'domain/authentication/i_auth_facade.dart';
import 'domain/geolocation/i_geolocation_facade.dart';
import 'domain/local_storage/i_local_storage_facade.dart';
import 'domain/settings/settings_entity.dart';
import 'domain/theme/theme_entity.dart';
import 'domain/weather/i_weather_facade.dart';
import 'domain/weather/weather_entity.dart';
import 'infrastructure/authentication/firebase_auth_facade.dart';
import 'infrastructure/authentication/firebase_injectable_module.dart';
import 'infrastructure/authentication/firebase_user_mapper.dart';
import 'infrastructure/geolocation/geolocator_facade.dart';
import 'infrastructure/geolocation/geolocator_injectable_module.dart';
import 'infrastructure/local_storage/local_storage_facade.dart';
import 'infrastructure/local_storage/local_storage_injectable_module.dart';
import 'infrastructure/logging/fimber_facade.dart';
import 'infrastructure/logging/i_logging_facade.dart';
import 'infrastructure/weather/weather_repository_facade.dart';
import 'infrastructure/weather/weather_repository_injectable_module.dart';

/// Environment names
const _dev = 'dev';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final gh = GetItHelper(g, environment);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final geolocatorInjectableModule = _$GeolocatorInjectableModule();
  final localStorageInjectableModule = _$LocalStorageInjectableModule();
  final weatherRepositoryInjectableModule =
      _$WeatherRepositoryInjectableModule();
  gh.lazySingleton<AuthenticationState>(() => AuthenticationState.initial());
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseUserMapper>(() => FirebaseUserMapper());
  gh.lazySingleton<Geolocator>(() => geolocatorInjectableModule.geolocator);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<ILoggingFacade<FimberLog>>(() => FimberFacade(),
      registerFor: {_dev});
  gh.lazySingleton<SettingsEntity>(() => SettingsEntity.celsius());
  final sharedPreferences = await localStorageInjectableModule.sharedPrefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<SignInFormState>(() => SignInFormState.initial());
  gh.lazySingleton<ThemeEntity>(() => ThemeEntity.initial());
  gh.lazySingleton<WeatherEntity>(() => WeatherEntity.initial());
  gh.lazySingleton<WeatherRepository>(
      () => weatherRepositoryInjectableModule.weatherRepository);
  gh.lazySingleton<WeatherState>(() => WeatherState.initial());
  gh.lazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        g<FirebaseAuth>(),
        g<GoogleSignIn>(),
        g<FirebaseUserMapper>(),
        g<ILoggingFacade<FimberLog>>(),
      ));
  gh.lazySingleton<IGeolocationFacade>(
      () => GeolocatorFacade(g<Geolocator>(), g<ILoggingFacade<FimberLog>>()));
  gh.lazySingleton<ILocalStorageFacade>(() => LocalStorageFacade(
      g<SharedPreferences>(), g<ILoggingFacade<FimberLog>>()));
  gh.lazySingleton<IWeatherFacade>(() => WeatherRepositoryFacade(
      g<WeatherRepository>(), g<ILoggingFacade<FimberLog>>()));
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

class _$GeolocatorInjectableModule extends GeolocatorInjectableModule {}

class _$LocalStorageInjectableModule extends LocalStorageInjectableModule {}

class _$WeatherRepositoryInjectableModule
    extends WeatherRepositoryInjectableModule {}
