import 'package:dartz/dartz.dart';
import 'package:large_states_rebuilder/domain/authentication/value_objects.dart';
import 'package:large_states_rebuilder/domain/core/errors.dart';
import 'package:large_states_rebuilder/domain/core/value_failure.dart';
import 'package:large_states_rebuilder/domain/core/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Core Value Object', () {
    EmailAddress _mockValidValueObject;

    setUp(() {
      _mockValidValueObject = EmailAddress('foo.bar@test.com');
    });
    test('should check whether getter value is working correctly', () {
      expect(_mockValidValueObject.value, right('foo.bar@test.com'));
      expect(EmailAddress('Foo').value,
          left(const ValueFailure.invalidEmail(failedValue: 'Foo')));
    });
    test('should check whether getOrCrash() is working correctly', () {
      expect(_mockValidValueObject.getOrCrash(), 'foo.bar@test.com');
      expect(() => EmailAddress('Foo').getOrCrash(),
          throwsA(isA<UnexpectedValueError>()));
    });
    test('should check whether getOrElse() is working correctly', () {
      expect(_mockValidValueObject.getOrElse('bar.foo@test.com'),
          'foo.bar@test.com');
      expect(EmailAddress('Foo').getOrElse('bar.foo@test.com'),
          'bar.foo@test.com');
    });
    test('should check whether getter failureOrUnit is working correctly', () {
      expect(_mockValidValueObject.failureOrUnit, right(unit));
      expect(EmailAddress('Foo').failureOrUnit,
          left(const ValueFailure.invalidEmail(failedValue: 'Foo')));
    });
    test('should check whether isValid is working correctly', () {
      expect(_mockValidValueObject.isValid(), isTrue);
      expect(EmailAddress('Foo').isValid(), isFalse);
    });
    test('should check whether getter hashCode is working correctly', () {
      expect(_mockValidValueObject.hashCode, 991766199);
    });
    test(
        'should check whether factory constructor UniqueId.fromUniqueString is throwing an AssertionError for null value',
        () {
      expect(() => UniqueId.fromUniqueString(null), throwsAssertionError);
    });
    test(
        'should check whether factory constructor StringSingleLine is throwing an AssertionError for null value',
        () {
      expect(() => StringSingleLine(null), throwsAssertionError);
    });
  });
}
