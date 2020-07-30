// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../core/unknown_route_page.dart';
import '../pages.dart';
import '../splash/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String authenticationPage = '/authentication-page';
  static const String weatherPage = '/weather-page';
  static const String settingsPage = '/settings-page';
  static const String searchPage = '/search-page';
  static const String unknownRoutePage = '*';
  static const all = <String>{
    splashPage,
    authenticationPage,
    weatherPage,
    settingsPage,
    searchPage,
    unknownRoutePage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.authenticationPage, page: AuthenticationPage),
    RouteDef(Routes.weatherPage, page: WeatherPage),
    RouteDef(Routes.settingsPage, page: SettingsPage),
    RouteDef(Routes.searchPage, page: SearchPage),
    RouteDef(Routes.unknownRoutePage, page: UnknownRoutePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    AuthenticationPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AuthenticationPage(),
        settings: data,
      );
    },
    WeatherPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => WeatherPage(),
        settings: data,
      );
    },
    SettingsPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SettingsPage(),
        settings: data,
      );
    },
    SearchPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SearchPage(),
        settings: data,
      );
    },
    UnknownRoutePage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => UnknownRoutePage(),
        settings: data,
      );
    },
  };
}
