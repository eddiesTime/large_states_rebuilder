import 'package:dartz/dartz.dart';
import 'package:large_states_rebuilder/domain/authentication/value_objects.dart';
import 'package:large_states_rebuilder/domain/core/value_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Auth Value Objects', () {
    test('should check whether EmailAddress is a string for "tester@test.com"',
        () {
      final EmailAddress _emailAddress = EmailAddress('tester@test.com');
      expect(_emailAddress.value, equals(const Right('tester@test.com')));
    });
    test(
        'should check whether EmailAddress is a ValueFailure of type invalidEmail for "Foo"',
        () {
      final EmailAddress _emailAddress = EmailAddress('Foo');
      expect(
        _emailAddress.value,
        equals(
          const Left(
            ValueFailure<String>.invalidEmail(failedValue: 'Foo'),
          ),
        ),
      );
    });
    test(
        'should check whether EmailAddress is throwing an AssertionError for null value',
        () {
      expect(() => EmailAddress(null), throwsAssertionError);
    });
    test('should check whether Password is a string for "FooBar123"', () {
      final Password _password = Password('FooBar123');
      expect(_password.value, equals(const Right('FooBar123')));
    });
    test(
        'should check whether Password is a ValueFailure of type shortPassword for "Foo"',
        () {
      final Password _password = Password('Foo');
      expect(
        _password.value,
        equals(
          const Left(
            ValueFailure<String>.shortPassword(failedValue: 'Foo'),
          ),
        ),
      );
    });
    test(
        'should check whether Password is throwing an AssertionError for null value',
        () {
      expect(() => Password(null), throwsAssertionError);
    });
  });
}
