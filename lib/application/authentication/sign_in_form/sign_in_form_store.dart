import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:large_states_rebuilder/domain/authentication/auth_failure.dart';
import 'package:large_states_rebuilder/domain/authentication/i_auth_facade.dart';
import 'package:large_states_rebuilder/domain/authentication/value_objects.dart';

part 'sign_in_form_state.dart';
part 'sign_in_form_store.freezed.dart';

class SignInFormStore {
  final IAuthFacade _authFacade;
  SignInFormStore(this._authFacade, this._signInFormState);

  SignInFormState _signInFormState;
  SignInFormState get state => _signInFormState;

  void emailChanged({@required String emailStr}) {
    _signInFormState = state.copyWith(
      emailAddress: EmailAddress(emailStr),
      authFailureOrSuccessOption: none(),
    );
  }

  void passwordChanged({@required String passwordStr}) {
    _signInFormState = state.copyWith(
      password: Password(passwordStr),
      authFailureOrSuccessOption: none(),
    );
  }

  Stream<void> registerWithEmailAndPasswordPressed() async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }
    yield _signInFormState = state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }

  Stream<void> signInWithEmailAndPasswordPressed() async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }
    yield _signInFormState = state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }

  Stream<void> signInWithGooglePressed() async* {
    yield _signInFormState = state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    );
    final failureOrSuccess = await _authFacade.signInWithGoogle();
    yield _signInFormState = state.copyWith(
      isSubmitting: false,
      authFailureOrSuccessOption: some(failureOrSuccess),
    );
  }
}
