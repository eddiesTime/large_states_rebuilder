import 'package:flutter/material.dart';
import 'package:large_states_rebuilder/application/authentication/sign_in_form/sign_in_form_store.dart';
import 'package:large_states_rebuilder/domain/authentication/i_auth_facade.dart';
import 'package:large_states_rebuilder/injection.dart';
import 'package:large_states_rebuilder/presentation/authentication/widgets/sign_in_form.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Injector(
        key: const Key('__Authentication_Page_Injector__'),
        inject: [
          Inject<SignInFormStore>(
            () =>
                SignInFormStore(getIt<IAuthFacade>(), getIt<SignInFormState>()),
          ),
        ],
        builder: (context) => const Center(
          key: Key('__AUTHENTICATION_PAGE_CENTER__'),
          child: SignInForm(
            key: Key('__SIGN_IN_FORM_WIDGET__'),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   body: Injector(
    //     key: const Key('__Auth_Page_BlocProvider<SignInFormBloc>__'),
    //     create: (context) => getIt<SignInFormBloc>(),
    //     child: const Center(
    //         key: Key('__AUTHENTICATION_PAGE_CENTER__'), child: SignInForm()),
    //   ),
    // );
  }
}
