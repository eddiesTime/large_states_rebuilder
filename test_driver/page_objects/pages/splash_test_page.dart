import 'package:flutter_driver/src/driver/driver.dart';

import '../elements/page_widget_test_element.dart';
import '../page_objects.dart';
import '../utils.dart';
import 'authentication_test_page.dart';
import 'test_page.dart';

class SplashTestPage extends TestPage {
  final _authPage = find.byValueKey('__AUTHENTICATION_PAGE_CENTER__');
  final _weatherPage = find.byValueKey('__Weather_App_Bar__');

  SplashTestPage(FlutterDriver driver) : super(driver);

  @override
  Future<bool> isReady({Duration timeout}) async {
    return widgetExists(driver, _weatherPage);
  }

  Future<bool> isUnAuthenticated({Duration timeout}) async => widgetExists(
        driver,
        _authPage,
        timeout: timeout,
      );

  AuthenticationTestPage get authPage => AuthenticationTestPage(driver);
  WeatherTestPage get weatherPage => WeatherTestPage(driver);
  PageWidgetTestElement get pageWidgetElement => PageWidgetTestElement(driver);
}
