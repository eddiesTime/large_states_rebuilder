import 'package:large_states_rebuilder/domain/core/value_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Core Value Failure', () {
    test(
        'should check whether ValueFailure.invalidLocation().toString() is working correctly',
        () {
      expect(
        const ValueFailure.invalidLocation(failedValue: 'Foo').toString(),
        'ValueFailure<String>.invalidLocation(failedValue: Foo)',
      );
    });
    test(
        'should check whether ValueFailure.empty().toString() is working correctly',
        () {
      expect(
        const ValueFailure.empty(failedValue: '').toString(),
        'ValueFailure<String>.empty(failedValue: )',
      );
    });
    test(
        'should check whether ValueFailure.multiline().toString() is working correctly',
        () {
      expect(
        const ValueFailure.multiline(failedValue: 'Foo\nBar').toString(),
        'ValueFailure<String>.multiline(failedValue: Foo\nBar)',
      );
    });
    test(
        'should check whether ValueFailure.invalidEmail().toString() is working correctly',
        () {
      expect(
        const ValueFailure.invalidEmail(failedValue: 'Foo').toString(),
        'ValueFailure<String>.invalidEmail(failedValue: Foo)',
      );
    });
    test(
        'should check whether ValueFailure.shortPassword().toString() is working correctly',
        () {
      expect(
        const ValueFailure.shortPassword(failedValue: 'Foo').toString(),
        'ValueFailure<String>.shortPassword(failedValue: Foo)',
      );
    });
  });
}
