import 'package:large_states_rebuilder/domain/core/errors.dart';
import 'package:large_states_rebuilder/domain/core/value_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Core Errors', () {
    test(
        'should check whether overridden toString() method is working correctly',
        () {
      const ValueFailure _failure = ValueFailure.empty(failedValue: 'Foo');
      final UnexpectedValueError _error = UnexpectedValueError(
        _failure,
      );
      expect(
          _error.toString(),
          Error.safeToString(
              'Encountered a ValueFailure at an unrecoverable point. Terminating. Failure was: ValueFailure<dynamic>.empty(failedValue: Foo)'));
    });
  });
}
