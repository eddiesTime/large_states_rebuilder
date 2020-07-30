import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:large_states_rebuilder/presentation/routes/router.dart';
import 'package:large_states_rebuilder/presentation/settings/widgets/settings.dart';

/// This widget functions as a container for the settings screen.
///
/// It builds a scaffold and contains the settings content.
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
    // return BlocListener<AuthenticationBloc, AuthenticationState>(
    //   listener: (context, state) {
    //     state.maybeMap(
    //         unauthenticated: (_) =>
    //             ExtendedNavigator.root.replace(Routes.authenticationPage),
    //         orElse: () {});
    //   },
    //   child: Scaffold(
    //     appBar: AppBar(
    //       key: const Key('__Settings_App_Bar__'),
    //       title: const Text('Settings'),
    //     ),
    //     body: Settings(),
    //   ),
    // );
  }
}
