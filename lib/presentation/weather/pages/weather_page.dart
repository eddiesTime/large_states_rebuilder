import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:large_states_rebuilder/presentation/routes/router.dart';
import 'package:large_states_rebuilder/presentation/weather/widgets/weather.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:large_states_rebuilder/application/weather/weather_store.dart';

import '../../../application/weather/weather_store.dart';

/// This widget functions as a container for the weather screen.
///
/// It is the initial screen which builds a scaffold and contains
/// the weather content.
class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    Injector.getAsReactive<WeatherStore>()
        .setState((s) => s.loadWeatherEntityFromStorage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('__Weather_App_Bar__'),
        title: const Text('States Rebuilder Weather'),
        actions: <Widget>[
          IconButton(
            key: const Key('__Settings_IconButton__'),
            icon: const Icon(Icons.settings),
            onPressed: () {
              ExtendedNavigator.root.push(Routes.settingsPage);
            },
          ),
        ],
      ),
      body: Weather(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key('__Geolocation_FAB__'),
            heroTag: 'LocationBtn',
            mini: true,
            backgroundColor: Colors.grey,
            onPressed: () async {
              await Injector.getAsReactive<WeatherStore>().setState(
                (s) => s.fetchWeatherForLocationWithLattLong(
                  requestTime: DateTime.now(),
                ),
              );
            },
            child: const Icon(
              Icons.location_on,
            ),
          ),
          FloatingActionButton(
            key: const Key('__Search_FAB__'),
            heroTag: 'SearchBtn',
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Injector.getAsReactive<WeatherStore>()
                  .setState((s) => s.newSearch());
              ExtendedNavigator.root.push(Routes.searchPage);
            },
            child: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}
