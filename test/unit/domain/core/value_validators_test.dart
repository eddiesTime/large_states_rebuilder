import 'package:dartz/dartz.dart';
import 'package:large_states_rebuilder/domain/core/value_failure.dart';
import 'package:large_states_rebuilder/domain/core/value_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Core Value Validator', () {
    test(
        'should check whether validateStringNotEmpty is returning ValueFailure.empty for empty input',
        () {
      final Either<ValueFailure<String>, String> _stringOrEmpty =
          validateStringNotEmpty('');
      expect(
        _stringOrEmpty,
        const Left(ValueFailure.empty(failedValue: '')),
      );
    });
    test(
        'should check whether validateStringNotEmpty is returning "Foo" for input "Foo"',
        () {
      final Either<ValueFailure<String>, String> _stringOrEmpty =
          validateStringNotEmpty('Foo');
      expect(
        _stringOrEmpty,
        const Right('Foo'),
      );
    });
    test(
        'should check whether validateSingleLine is returning ValueFailure.multiline for input "Foo\nBar"',
        () {
      final Either<ValueFailure<String>, String> _stringOrEmpty =
          validateSingleLine('Foo\nBar');
      expect(
        _stringOrEmpty,
        const Left(ValueFailure.multiline(failedValue: 'Foo\nBar')),
      );
    });
    test(
        'should check whether validateSingleLine is returning "Foo Bar" for input "Foo Bar"',
        () {
      final Either<ValueFailure<String>, String> _stringOrEmpty =
          validateSingleLine('Foo Bar');
      expect(
        _stringOrEmpty,
        const Right("Foo Bar"),
      );
    });
    test(
        'should check whether validateEmailAddress is returning ValueFailure.invalidEmail for input "Foo"',
        () {
      final Either<ValueFailure<String>, String> _stringOrEmpty =
          validateEmailAddress('Foo');
      expect(
        _stringOrEmpty,
        const Left(ValueFailure.invalidEmail(failedValue: 'Foo')),
      );
    });
    test(
        'should check whether validateEmailAddress is returning "tester@test.com" for input "tester@test.com"',
        () {
      final Either<ValueFailure<String>, String> _stringOrEmpty =
          validateEmailAddress('tester@test.com');
      expect(
        _stringOrEmpty,
        const Right("tester@test.com"),
      );
    });
    test(
        'should check whether validateCityString is returning ValueFailure.invalidLocation for input "Foo123"',
        () {
      final Either<ValueFailure<String>, String> _stringOrEmpty =
          validateCityString('Foo123');
      expect(
        _stringOrEmpty,
        const Left(ValueFailure.invalidLocation(failedValue: 'Foo123')),
      );
    });
    test(
        'should check whether validateCityString is returning "London" for input "London"',
        () {
      final Either<ValueFailure<String>, String> _stringOrEmpty =
          validateCityString('London');
      expect(
        _stringOrEmpty,
        const Right("London"),
      );
    });
    test(
        'should check whether validatePassword is returning ValueFailure.shortPassword for input "Foo"',
        () {
      final Either<ValueFailure<String>, String> _stringOrEmpty =
          validatePassword('Foo');
      expect(
        _stringOrEmpty,
        const Left(ValueFailure.shortPassword(failedValue: 'Foo')),
      );
    });
    test(
        'should check whether validatePassword is returning "FooBar123" for input "FooBar123"',
        () {
      final Either<ValueFailure<String>, String> _stringOrEmpty =
          validatePassword('Foo Bar');
      expect(
        _stringOrEmpty,
        const Right("Foo Bar"),
      );
    });
  });
}
