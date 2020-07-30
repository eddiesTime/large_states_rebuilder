import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:large_states_rebuilder/domain/authentication/auth_failure.dart';
import 'package:large_states_rebuilder/domain/authentication/i_auth_facade.dart';
import 'package:large_states_rebuilder/domain/authentication/user_entity.dart';
import 'package:large_states_rebuilder/domain/authentication/value_objects.dart';
import 'package:large_states_rebuilder/infrastructure/authentication/firebase_user_mapper.dart';
import 'package:large_states_rebuilder/infrastructure/logging/i_logging_facade.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:fimber/fimber.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseUserMapper _firebaseUserMapper;
  final ILoggingFacade<FimberLog> _loggingFacade;
  FimberLog _logger;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn,
      this._firebaseUserMapper, this._loggingFacade) {
    _logger = _loggingFacade.createNamedLogger(name: 'Auth Facade');
  }

  @override
  Future<Option<UserEntity>> getSignedInUser() async => _firebaseAuth
      .currentUser()
      .then((u) => optionOf(_firebaseUserMapper.toDomain(u)));

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    final emailAddressStr = emailAddress.value.getOrElse(() => 'INVALID EMAIL');
    final passwordStr = password.value.getOrElse(() => 'INVALID PASSWORD');
    try {
      return await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: emailAddressStr,
            password: passwordStr,
          )
          .then((_) => right(unit));
    } on PlatformException catch (e, s) {
      _loggingFacade.logError(
          logger: _logger,
          message: 'Register with email and password.',
          exception: e,
          stackTrace: s);
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    final emailAddressStr = emailAddress.value.getOrElse(() => 'INVALID EMAIL');
    final passwordStr = password.value.getOrElse(() => 'INVALID PASSWORD');
    try {
      return await _firebaseAuth
          .signInWithEmailAndPassword(
            email: emailAddressStr,
            password: passwordStr,
          )
          .then((_) => right(unit));
    } on PlatformException catch (e, s) {
      _loggingFacade.logError(
          logger: _logger,
          message: 'Sign in with email and password',
          exception: e,
          stackTrace: s);
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      }
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final GoogleSignInAuthentication googleAuthentication =
          await googleUser.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.getCredential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => right(unit));
    } on PlatformException catch (e, s) {
      _loggingFacade.logError(
          logger: _logger,
          message: 'Sign in with Google',
          exception: e,
          stackTrace: s);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);
    } catch (e, s) {
      _loggingFacade.logError(
          logger: _logger, message: 'Logout', exception: e, stackTrace: s);
    }
  }
}
