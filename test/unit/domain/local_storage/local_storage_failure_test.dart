import 'package:large_states_rebuilder/domain/local_storage/local_storage_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Local Storage Failure', () {
    test(
        'should check whether LocalStorageFailure.noDataStored().toString() is working correctly',
        () {
      expect(
        const LocalStorageFailure.noDataStored().toString(),
        'LocalStorageFailure<dynamic>.noDataStored()',
      );
    });
  });
}
