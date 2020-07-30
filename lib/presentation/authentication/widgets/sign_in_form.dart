import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:large_states_rebuilder/application/authentication/authentication_store.dart';
import 'package:large_states_rebuilder/application/authentication/sign_in_form/sign_in_form_store.dart';
import 'package:large_states_rebuilder/presentation/routes/router.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:styled_widget/styled_widget.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReactiveModel<SignInFormStore> _reactiveSignInFormStoreModel =
        Injector.getAsReactive<SignInFormStore>();
    final ReactiveModel<AuthenticationStore> _reactiveAuthenticationStoreModel =
        Injector.getAsReactive<AuthenticationStore>();
    return OnSetStateListener<SignInFormStore>(
        observe: () => _reactiveSignInFormStoreModel,
        onData: (context, _) {
          return _reactiveSignInFormStoreModel.setState(
            (currentState) =>
                currentState.state.authFailureOrSuccessOption.fold(
              () {},
              (either) {
                either.fold(
                  (failure) {
                    FlushbarHelper.createError(
                      message: failure.map(
                        // Use localized strings here in your apps
                        cancelledByUser: (_) => 'Cancelled',
                        serverError: (_) => 'Server error',
                        emailAlreadyInUse: (_) => 'Email already in use',
                        invalidEmailAndPasswordCombination: (_) =>
                            'Invalid email and password combination',
                      ),
                    ).show(context);
                  },
                  (_) {
                    ExtendedNavigator.root.replace(Routes.weatherPage);
                    _reactiveAuthenticationStoreModel.setState(
                        (currentState) => currentState.authCheckRequested());
                  },
                );
              },
            ),
          );
        },
        child: StateBuilder<SignInFormStore>(
            observe: () => _reactiveSignInFormStoreModel,
            builder: (context, _) {
              return Form(
                key: const Key('__Sign_In_Form__'),
                autovalidate:
                    _reactiveSignInFormStoreModel.state.state.showErrorMessages,
                child: ListView(
                  key: const Key('__Sign_In_Form_List_View__'),
                  padding: const EdgeInsets.all(8.0),
                  children: <Widget>[
                    Container(
                      key: const Key('__Flutter_Logo_Container__'),
                      height: 200.0,
                      width: 200.0,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/flutter_logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      key: const Key('__Email_Text_Form_Field__'),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                      autocorrect: false,
                      onChanged: (value) => _reactiveSignInFormStoreModel
                          .setState((s) => s.emailChanged(emailStr: value)),
                      validator: (_) => _reactiveSignInFormStoreModel
                          .state.state.emailAddress.value
                          .fold(
                        (f) => f.maybeMap(
                          invalidEmail: (_) => 'Invalid email',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      key: const Key('__Password_Text_Form_Field__'),
                      // controller: passwordController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      autocorrect: false,
                      onChanged: (value) =>
                          _reactiveSignInFormStoreModel.setState(
                              (s) => s.passwordChanged(passwordStr: value)),
                      validator: (_) => _reactiveSignInFormStoreModel
                          .state.state.password.value
                          .fold(
                        (f) => f.maybeMap(
                          shortPassword: (_) => 'Short password',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            key: const Key('__Sign_In_Form_Sign_In_Button__'),
                            onPressed: () =>
                                _reactiveSignInFormStoreModel.setState((s) =>
                                    s.signInWithEmailAndPasswordPressed()),
                            child: const Text('SIGN IN'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: FlatButton(
                            key: const Key('__Sign_In_Form_Register_Button__'),
                            onPressed: () =>
                                _reactiveSignInFormStoreModel.setState((s) =>
                                    s.registerWithEmailAndPasswordPressed()),
                            child: const Text('REGISTER'),
                          ),
                        ),
                      ],
                    ),
                    RaisedButton(
                      key: const Key(
                          '__Sign_In_Form_Sign_In_With_Google_Button__'),
                      onPressed: () => _reactiveSignInFormStoreModel
                          .setState((s) => s.signInWithGooglePressed()),
                      color: Colors.lightBlue,
                      child: const Text(
                        'SIGN IN WITH GOOGLE',
                      ).textColor(Colors.white).bold(),
                    ),
                    if (_reactiveSignInFormStoreModel
                        .state.state.isSubmitting) ...[
                      const SizedBox(height: 8),
                      const LinearProgressIndicator(),
                    ]
                  ],
                ),
              );
            })
        // listener: (context, state) {
        //   state.authFailureOrSuccessOption.fold(
        //     () {},
        //     (either) {
        //       either.fold(
        //         (failure) {
        //           FlushbarHelper.createError(
        //             message: failure.map(
        //               // Use localized strings here in your apps
        //               cancelledByUser: (_) => 'Cancelled',
        //               serverError: (_) => 'Server error',
        //               emailAlreadyInUse: (_) => 'Email already in use',
        //               invalidEmailAndPasswordCombination: (_) =>
        //                   'Invalid email and password combination',
        //             ),
        //           ).show(context);
        //         },
        //         (_) {
        //           ExtendedNavigator.root.replace(Routes.weatherPage);
        //           context
        //               .bloc<AuthenticationBloc>()
        //               .add(const AuthenticationEvent.authCheckRequested());
        //         },
        //       );
        //     },
        //   );
        // },
        // builder: (context, state) {
        //   return Form(
        //     key: const Key('__Sign_In_Form__'),
        //     autovalidate: state.showErrorMessages,
        //     child: ListView(
        //       key: const Key('__Sign_In_Form_List_View__'),
        //       padding: const EdgeInsets.all(8.0),
        //       children: <Widget>[
        //         Container(
        //           key: const Key('__Flutter_Logo_Container__'),
        //           height: 200.0,
        //           width: 200.0,
        //           clipBehavior: Clip.hardEdge,
        //           decoration: const BoxDecoration(
        //             image: DecorationImage(
        //               image: AssetImage('assets/flutter_logo.png'),
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //         ),
        //         const SizedBox(height: 8),
        //         TextFormField(
        //           key: const Key('__Email_Text_Form_Field__'),
        //           decoration: const InputDecoration(
        //             prefixIcon: Icon(Icons.email),
        //             labelText: 'Email',
        //           ),
        //           autocorrect: false,
        //           onChanged: (value) => context
        //               .bloc<SignInFormBloc>()
        //               .add(SignInFormEvent.emailChanged(value)),
        //           validator: (_) => context
        //               .bloc<SignInFormBloc>()
        //               .state
        //               .emailAddress
        //               .value
        //               .fold(
        //                 (f) => f.maybeMap(
        //                   invalidEmail: (_) => 'Invalid email',
        //                   orElse: () => null,
        //                 ),
        //                 (_) => null,
        //               ),
        //         ),
        //         const SizedBox(height: 8),
        //         TextFormField(
        //           key: const Key('__Password_Text_Form_Field__'),
        //           // controller: passwordController,
        //           decoration: const InputDecoration(
        //             prefixIcon: Icon(Icons.lock),
        //             labelText: 'Password',
        //           ),
        //           obscureText: true,
        //           autocorrect: false,
        //           onChanged: (value) => context
        //               .bloc<SignInFormBloc>()
        //               .add(SignInFormEvent.passwordChanged(value)),
        //           validator: (_) =>
        //               context.bloc<SignInFormBloc>().state.password.value.fold(
        //                     (f) => f.maybeMap(
        //                       shortPassword: (_) => 'Short password',
        //                       orElse: () => null,
        //                     ),
        //                     (_) => null,
        //                   ),
        //         ),
        //         const SizedBox(height: 8),
        //         Row(
        //           children: <Widget>[
        //             Expanded(
        //               child: FlatButton(
        //                 key: const Key('__Sign_In_Form_Sign_In_Button__'),
        //                 onPressed: () => context.bloc<SignInFormBloc>().add(
        //                     const SignInFormEvent
        //                         .signInWithEmailAndPasswordPressed()),
        //                 child: const Text('SIGN IN'),
        //               ),
        //             ),
        //             const SizedBox(width: 8),
        //             Expanded(
        //               child: FlatButton(
        //                 key: const Key('__Sign_In_Form_Register_Button__'),
        //                 onPressed: () => context.bloc<SignInFormBloc>().add(
        //                     const SignInFormEvent
        //                         .registerWithEmailAndPasswordPressed()),
        //                 child: const Text('REGISTER'),
        //               ),
        //             ),
        //           ],
        //         ),
        //         RaisedButton(
        //           key: const Key('__Sign_In_Form_Sign_In_With_Google_Button__'),
        //           onPressed: () => context
        //               .bloc<SignInFormBloc>()
        //               .add(const SignInFormEvent.signInWithGooglePressed()),
        //           color: Colors.lightBlue,
        //           child: const Text(
        //             'SIGN IN WITH GOOGLE',
        //           ).textColor(Colors.white).bold(),
        //         ),
        //         if (state.isSubmitting) ...[
        //           const SizedBox(height: 8),
        //           const LinearProgressIndicator(),
        //         ]
        //       ],
        //     ),
        //   );
        // },
        );
  }
}
