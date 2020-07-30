import 'package:flutter_driver/flutter_driver.dart';
import 'package:ozzie/ozzie.dart';
import 'package:test/test.dart';

import 'page_objects/page_objects.dart';

void main() {
  group('Weather App', () {
    FlutterDriver driver;
    Ozzie ozzie;
    WeatherTestPage weatherTestPage;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      ozzie = Ozzie.initWith(
        driver,
        groupName: 'Weather App',
        shouldTakeScreenshots: false,
      );
      weatherTestPage = WeatherTestPage(driver);
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
      ozzie.generateHtmlReport();
    });

    test('starts with initial page', () async {
      await ozzie.profilePerformance('initial page', () async {
        expect(await weatherTestPage.isReady(), isTrue);
        await ozzie.takeScreenshot('initial page');
      });
    });

    test(
        'should be able to tap on search floating action button to navigate to location search page',
        () async {
      await ozzie.profilePerformance('move to location search page and back',
          () async {
        expect(await weatherTestPage.isReady(), isTrue);
        await ozzie.takeScreenshot('initial page');
        final LocationSearchTestPage locationSearchTestPage =
            await weatherTestPage.tapSearchFabButton();
        expect(await locationSearchTestPage.isReady(), isTrue);
        await ozzie.takeScreenshot('location search page');
        await locationSearchTestPage.tapBackButton();
        await ozzie.takeScreenshot('home page');
      });
    });
    test(
        'should be able to tap on settings icon button to navigate to settings page',
        () async {
      await ozzie.profilePerformance('move to settings page and back',
          () async {
        expect(await weatherTestPage.isReady(), isTrue);
        await ozzie.takeScreenshot('initial page');
        final SettingsTestPage settingsTestPage =
            await weatherTestPage.tapSettingsIconButton();
        expect(await settingsTestPage.isReady(), isTrue);
        await ozzie.takeScreenshot('settings page');
        await settingsTestPage.tapBackButton();
        await ozzie.takeScreenshot('home page');
      });
    });

    test('should be able to search for weather data for a given location',
        () async {
      await ozzie.profilePerformance('location search', () async {
        expect(await weatherTestPage.isReady(), isTrue);
        await ozzie.takeScreenshot('home page');
        final LocationSearchTestPage locationSearchTestPage =
            await weatherTestPage.tapSearchFabButton();
        expect(await locationSearchTestPage.isReady(), isTrue);
        await ozzie.takeScreenshot('location search page');
        await locationSearchTestPage.locationSearchTestElement
            .enterLocation('London');
        await ozzie.takeScreenshot('entered location');
        await locationSearchTestPage.locationSearchTestElement
            .tapSearchIconButton();
        expect(await weatherTestPage.isReady(), isTrue);
        await ozzie.takeScreenshot('weather page');
        final weatherTestElement = weatherTestPage.weatherTestElement;
        expect(await weatherTestElement.isLoaded, isTrue);
        expect(await weatherTestElement.gradientContainer, isTrue);
        expect(await weatherTestElement.location, isTrue);
        expect(await weatherTestElement.lastUpdated, isTrue);
        expect(await weatherTestElement.combinedWeatherTemperature, isTrue);
      });
    });

    test('should be able to switch from celcius to fahrenheit', () async {
      await ozzie.profilePerformance('change settings', () async {
        expect(await weatherTestPage.isReady(), isTrue);
        await ozzie.takeScreenshot('weather page with celcius');
        final weatherTestElement = weatherTestPage.weatherTestElement;
        String temperatureWidgetText =
            await weatherTestElement.temperatureWidgetText;
        expect(temperatureWidgetText.contains('°C'), isTrue);
        final SettingsTestPage settingsTestPage =
            await weatherTestPage.tapSettingsIconButton();
        expect(await settingsTestPage.isReady(), isTrue);
        await ozzie.takeScreenshot('settings page celcius switch');
        final settingsTestElement = settingsTestPage.settingsTestElement;
        await settingsTestElement.tapTemperatureUnitSwitch();
        await ozzie.takeScreenshot('settings page fahrenheit switch');
        await settingsTestPage.tapBackButton();
        temperatureWidgetText = await weatherTestElement.temperatureWidgetText;
        expect(temperatureWidgetText.contains('°F'), isTrue);
        await ozzie.takeScreenshot('weather page with fahrenheit');
      });
    });
  });
}
