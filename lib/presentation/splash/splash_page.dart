import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:large_states_rebuilder/application/authentication/authentication_store.dart';
import 'package:large_states_rebuilder/presentation/routes/router.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ReactiveModel<AuthenticationStore> _reactiveModel =
        Injector.getAsReactive<AuthenticationStore>();
    return OnSetStateListener<AuthenticationStore>(
      observe: () => _reactiveModel,
      onData: (context, _) {
        return _reactiveModel.setState(
          (s) => s.state.map(
            initial: (_) {},
            authenticated: (_) =>
                ExtendedNavigator.root.replace(Routes.weatherPage),
            unauthenticated: (_) =>
                ExtendedNavigator.root.replace(Routes.authenticationPage),
          ),
        );
      },
      child: _PageWidget(),
    );
    // return BlocListener<AuthenticationBloc, AuthenticationState>(
    //   listener: (context, state) {
    //     state.map(
    //       initial: (_) {},
    //       authenticated: (_) =>
    //           ExtendedNavigator.root.replace(Routes.weatherPage),
    //       unauthenticated: (_) =>
    //           ExtendedNavigator.root.replace(Routes.authenticationPage),
    //     );
    //   },
    //   child: _PageWidget(),
    // );
  }
}

class _PageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
