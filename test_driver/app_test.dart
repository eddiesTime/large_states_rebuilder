import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'page_objects/page_objects.dart';
import 'page_objects/pages/authentication_test_page.dart';
import 'page_objects/pages/splash_test_page.dart';

void main() {
  group('Weather App', () {
    FlutterDriver driver;
    AuthenticationTestPage authenticationPage;
    WeatherTestPage weatherTestPage;
    SplashTestPage splashTestPage;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.startTracing();

      splashTestPage = SplashTestPage(driver);
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('starts with authentication page', () async {
      expect(await splashTestPage.isUnAuthenticated(), isTrue);
      authenticationPage = splashTestPage.authPage;
      expect(await authenticationPage.isReady(), isTrue);
    });

    test('should log into the app', () async {
      expect(await authenticationPage.isReady(), isTrue);
      final _signInFormTestElement = authenticationPage.signInFormTestElement;
      await _signInFormTestElement.enterEmail('foo.bar@test.com');
      await _signInFormTestElement.enterPassword('FooBar123');
      await _signInFormTestElement.tapSignInButton();
      weatherTestPage = splashTestPage.weatherPage;
      expect(await weatherTestPage.isReady(), isTrue);
    });

    test(
        'should be able to tap on settings icon button to navigate to settings page',
        () async {
      expect(await weatherTestPage.isReady(), isTrue);

      final SettingsTestPage settingsTestPage =
          await weatherTestPage.tapSettingsIconButton();
      expect(await settingsTestPage.isReady(), isTrue);

      await settingsTestPage.tapBackButton();
    });

    test('should be able to search for weather data for a given location',
        () async {
      expect(await weatherTestPage.isReady(), isTrue);

      final LocationSearchTestPage locationSearchTestPage =
          await weatherTestPage.tapSearchFabButton();
      expect(await locationSearchTestPage.isReady(), isTrue);

      await locationSearchTestPage.locationSearchTestElement
          .enterLocation('London');

      await locationSearchTestPage.locationSearchTestElement
          .tapSearchIconButton();
      expect(await weatherTestPage.isReady(), isTrue);

      final weatherTestElement = weatherTestPage.weatherTestElement;
      expect(await weatherTestElement.isLoaded, isTrue);
      expect(await weatherTestElement.gradientContainer, isTrue);
      expect(await weatherTestElement.location, isTrue);
      expect(await weatherTestElement.lastUpdated, isTrue);
      expect(await weatherTestElement.combinedWeatherTemperature, isTrue);
    });

    test('should be able to switch from celcius to fahrenheit', () async {
      expect(await weatherTestPage.isReady(), isTrue);

      final weatherTestElement = weatherTestPage.weatherTestElement;
      String temperatureWidgetText =
          await weatherTestElement.temperatureWidgetText;
      expect(temperatureWidgetText.contains('°C'), isTrue);
      final SettingsTestPage settingsTestPage =
          await weatherTestPage.tapSettingsIconButton();
      expect(await settingsTestPage.isReady(), isTrue);

      final settingsTestElement = settingsTestPage.settingsTestElement;
      await settingsTestElement.tapTemperatureUnitSwitch();

      await settingsTestPage.tapBackButton();
      temperatureWidgetText = await weatherTestElement.temperatureWidgetText;
      expect(temperatureWidgetText.contains('°F'), isTrue);
    });

    test('should log out of app', () async {
      expect(await weatherTestPage.isReady(), isTrue);
      final SettingsTestPage settingsTestPage =
          await weatherTestPage.tapSettingsIconButton();
      expect(await settingsTestPage.isReady(), isTrue);
      final settingsTestElement = settingsTestPage.settingsTestElement;
      await settingsTestElement.tapLogout();

      expect(await authenticationPage.isReady(), isTrue);
      final Timeline _timeline = await driver.stopTracingAndDownloadTimeline();

      final summary = TimelineSummary.summarize(_timeline);

      await summary.writeSummaryToFile(
          '${DateTime.now()}:_summary_states_rebuilder',
          pretty: true);

      await summary.writeTimelineToFile(
          '${DateTime.now()}:_timeline_states_rebuilder',
          pretty: true);
    });
  });
}
