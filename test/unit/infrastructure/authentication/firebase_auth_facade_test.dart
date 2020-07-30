import 'package:dartz/dartz.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:large_states_rebuilder/domain/authentication/auth_failure.dart';
import 'package:large_states_rebuilder/domain/authentication/user_entity.dart';
import 'package:large_states_rebuilder/domain/authentication/value_objects.dart';
import 'package:large_states_rebuilder/infrastructure/authentication/firebase_auth_facade.dart';
import 'package:large_states_rebuilder/infrastructure/authentication/firebase_user_mapper.dart';
import 'package:large_states_rebuilder/infrastructure/logging/fimber_facade.dart';
import 'package:large_states_rebuilder/infrastructure/logging/i_logging_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

GetIt sl = GetIt.instance;

class MockLoggingFacade extends Mock implements ILoggingFacade<FimberLog> {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockFirebaseUserMapper extends Mock implements FirebaseUserMapper {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

// ignore: avoid_implementing_value_types
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockAuthCredential extends Mock implements AuthCredential {}

class MockAuthResult extends Mock implements AuthResult {}

class MockGoogleAuthProvider extends Mock implements GoogleAuthProvider {
  // final MockAuthCredential _credentials;
  static MockAuthCredential _credentials;

  MockGoogleAuthProvider(MockAuthCredential credentials) {
    _credentials = credentials;
  }

  @override
  // ignore: override_on_non_overriding_member
  static AuthCredential getCredential() {
    return _credentials;
  }
  // static AuthCredential getCredential() {
  //   return _credentials;
  // }
}

class MockUserEntity extends Mock implements UserEntity {}

void main() {
  sl.registerLazySingleton<ILoggingFacade<FimberLog>>(() => FimberFacade());
  group('Firebase Auth Facade', () {
    FirebaseAuthFacade _authFacade;
    FirebaseAuth _firebaseAuth;
    GoogleSignIn _googleSignIn;
    FirebaseUserMapper _firebaseUserMapper;
    FirebaseUser _mockUser;
    UserEntity _mockUserEntity;
    GoogleSignInAccount _mockGoogleSignInAccount;
    ILoggingFacade<FimberLog> _loggingFacade;
    final EmailAddress _mockEmail = EmailAddress('foo.bar@test.com');
    final Password _mockPassword = Password('FooBar123');
    final emailAddressStr = _mockEmail.value.getOrElse(() => 'INVALID EMAIL');
    final passwordStr = _mockPassword.value.getOrElse(() => 'INVALID PASSWORD');

    setUp(() {
      _firebaseAuth = MockFirebaseAuth();
      _googleSignIn = MockGoogleSignIn();
      _firebaseUserMapper = MockFirebaseUserMapper();
      _loggingFacade = MockLoggingFacade();
      _mockUser = MockFirebaseUser();
      _mockUserEntity = MockUserEntity();
      _mockGoogleSignInAccount = MockGoogleSignInAccount();
      _authFacade = FirebaseAuthFacade(
        _firebaseAuth,
        _googleSignIn,
        _firebaseUserMapper,
        _loggingFacade,
      );
    });

    test(
        'should check whether getSignedInUser is working correctly for none case',
        () async {
      verify(_loggingFacade.createNamedLogger(name: 'Auth Facade')).called(1);
      when(_firebaseAuth.currentUser()).thenAnswer((_) => Future.value());
      expect(await _authFacade.getSignedInUser(), none());
    });
    test(
        'should check whether getSignedInUser is working correctly for some case',
        () async {
      verify(_loggingFacade.createNamedLogger(name: 'Auth Facade')).called(1);
      when(_firebaseUserMapper.toDomain(_mockUser))
          .thenAnswer((_) => _mockUserEntity);
      when(_firebaseAuth.currentUser())
          .thenAnswer((_) => Future.value(_mockUser));
      expect(await _authFacade.getSignedInUser(), some(_mockUserEntity));
    });
// REGISTER USER WITH EMAIL AND PASSWORD
    test(
        'should check wether registerWithEmailAndPassword is working correctly for success case',
        () async {
      /// Email Adresse übergeben
      /// Password übergeben
      /// fireBaseAuth answer with mock
      /// expect unit
      when(_firebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenAnswer((_) => Future.value());
      expect(
          await _authFacade.registerWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword),
          right(unit));
    });
    test(
        'should check wether registerWithEmailAndPassword is working correctly for failure case "Email Already In Use"',
        () async {
      /// firebase Auth
      /// throw PlatformException
      /// [e.code] == already in use
      when(_firebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenThrow(PlatformException(code: 'ERROR_EMAIL_ALREADY_IN_USE'));
      when(_loggingFacade.logError(
              logger: null, message: 'Register with email and password.'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Register with email and password.'),
          throwsArgumentError);
      expect(
          await _authFacade.registerWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword),
          left(const AuthFailure.emailAlreadyInUse()));
    });
    test(
        'should check wether registerWithEmailAndPassword is working correctly for failure case "Server Error"',
        () async {
      when(_firebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenThrow(PlatformException(code: ''));
      when(_loggingFacade.logError(
              logger: null, message: 'Register with email and password.'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Register with email and password.'),
          throwsArgumentError);
      expect(
          await _authFacade.registerWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword),
          left(const AuthFailure.serverError()));
    });
    // SIGN IN WITH EMAIL AND PASSWORD
    test(
        'should check wether signInWithEmailAndPassword is working correctly for success case',
        () async {
      when(_firebaseAuth.signInWithEmailAndPassword(
              email: 'foo.bar@test.com', password: 'FooBar123'))
          .thenAnswer((_) => Future.value());
      expect(
          await _authFacade.signInWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword),
          right(unit));
    });
    test(
        'should check wether signInWithEmailAndPassword is working correctly for failure case "Wrong Password"',
        () async {
      when(_firebaseAuth.signInWithEmailAndPassword(
              email: 'foo.bar@test.com', password: 'FooBar123'))
          .thenThrow(PlatformException(code: 'ERROR_WRONG_PASSWORD'));
      when(_loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'),
          throwsArgumentError);
      expect(
          await _authFacade.signInWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword),
          left(const AuthFailure.invalidEmailAndPasswordCombination()));
    });
    test(
        'should check wether signInWithEmailAndPassword is working correctly for failure case "User not found"',
        () async {
      when(_firebaseAuth.signInWithEmailAndPassword(
              email: 'foo.bar@test.com', password: 'FooBar123'))
          .thenThrow(PlatformException(code: 'ERROR_USER_NOT_FOUND'));
      when(_loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'),
          throwsArgumentError);
      expect(
          await _authFacade.signInWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword),
          left(const AuthFailure.invalidEmailAndPasswordCombination()));
    });
    test(
        'should check wether signInWithEmailAndPassword is working correctly for failure case "Server Error"',
        () async {
      when(_firebaseAuth.signInWithEmailAndPassword(
              email: 'foo.bar@test.com', password: 'FooBar123'))
          .thenThrow(PlatformException(code: ''));
      when(_loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
              logger: null, message: 'Sign in with email and password'),
          throwsArgumentError);
      expect(
          await _authFacade.signInWithEmailAndPassword(
              emailAddress: _mockEmail, password: _mockPassword),
          left(const AuthFailure.serverError()));
    });
    // SIGN IN WITH GOOGLE
    test(
        'should check wether signInWithGoogle is working correctly for failure case "Canceled By User"',
        () async {
      when(_googleSignIn.signIn()).thenAnswer((_) => Future.value());
      expect(await _authFacade.signInWithGoogle(),
          left(const AuthFailure.cancelledByUser()));
    });
    // test(
    //     'should check wether signInWithGoogle is working correctly for success case',
    //     () async {
    //   when(_googleSignIn.signIn())
    //       .thenAnswer((_) => Future.value(_mockGoogleAccount));
    //   when(_mockGoogleAccount.authentication)
    //       .thenAnswer((_) => Future.value(_mockGoogleAuthentication));
    //   // when(MockGoogleAuthProvider.getCredential())
    //   //     .thenAnswer((_) => _mockAuthCredential);
    //   when(_firebaseAuth.signInWithCredential(_mockAuthCredential))
    //       .thenAnswer((_) => Future.value(_mockAuthResult));
    //   // expect(await _authFacade.signInWithGoogle(), right(unit));
    //   await _authFacade.signInWithGoogle();
    // });
    test(
        'should check wether signInWithGoogle is working correctly for failure case',
        () async {
      when(_googleSignIn.signIn())
          .thenAnswer((_) => Future.value(_mockGoogleSignInAccount));
      when(_mockGoogleSignInAccount.authentication)
          .thenThrow(PlatformException(code: ''));
      when(_loggingFacade.logError(
              logger: null, message: 'Sign in with Google'))
          .thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
                logger: null,
                message: 'Sign in with Google',
              ),
          throwsArgumentError);
      expect(await _authFacade.signInWithGoogle(),
          left(const AuthFailure.serverError()));
    });
    // SIGN OUT
    test('should check wether signOut is working correctly for failure case',
        () async {
      when(_googleSignIn.signOut())
          .thenAnswer((_) => Future.error(const FormatException()));
      when(_firebaseAuth.signOut())
          .thenAnswer((_) => Future.error(const FormatException()));
      when(_loggingFacade.logError(
        logger: null,
        message: 'Logout',
      )).thenThrow(ArgumentError());
      expect(
          () => _loggingFacade.logError(
                logger: null,
                message: 'Logout',
              ),
          throwsArgumentError);
      expect(() => _authFacade.signOut(), throwsFormatException);
      verify(_loggingFacade.logError(logger: null, message: 'Logout'))
          .called(1);
    });
    test('should check wether signOut is working correctly for success case',
        () async {
      when(_googleSignIn.signOut()).thenAnswer((_) => Future.value());
      when(_firebaseAuth.signOut()).thenAnswer((_) => Future.value());
      await _authFacade.signOut();
      verify(_googleSignIn.signOut()).called(1);
      verify(_firebaseAuth.signOut()).called(1);
    });
  });
}
