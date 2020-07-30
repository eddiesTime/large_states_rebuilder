import 'package:large_states_rebuilder/domain/authentication/auth_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Auth Failure', () {
    test(
        'should check whether Authfailure.cancelledByUser().toString() is working correctly',
        () {
      expect(
        const AuthFailure.cancelledByUser().toString(),
        'AuthFailure.cancelledByUser()',
      );
    });
    test(
        'should check whether Authfailure.serverError().toString() is working correctly',
        () {
      expect(
        const AuthFailure.serverError().toString(),
        'AuthFailure.serverError()',
      );
    });
    test(
        'should check whether Authfailure.emailAlreadyInUse().toString() is working correctly',
        () {
      expect(
        const AuthFailure.emailAlreadyInUse().toString(),
        'AuthFailure.emailAlreadyInUse()',
      );
    });
    test(
        'should check whether Authfailure.invalidEmailAndPasswordCombination().toString() is working correctly',
        () {
      expect(
        const AuthFailure.invalidEmailAndPasswordCombination().toString(),
        'AuthFailure.invalidEmailAndPasswordCombination()',
      );
    });
  });
}
