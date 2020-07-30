import 'package:auto_route/auto_route_annotations.dart';
import 'package:large_states_rebuilder/presentation/authentication/pages/authentication_page.dart';
import 'package:large_states_rebuilder/presentation/core/unknown_route_page.dart';
import 'package:large_states_rebuilder/presentation/pages.dart';
import 'package:large_states_rebuilder/presentation/splash/splash_page.dart';

export 'router.gr.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: SplashPage, initial: true),
  AdaptiveRoute(page: AuthenticationPage),
  AdaptiveRoute(page: WeatherPage),
  AdaptiveRoute(page: SettingsPage),
  AdaptiveRoute(page: SearchPage),
  AdaptiveRoute(path: '*', page: UnknownRoutePage),
])
class $Router {}
