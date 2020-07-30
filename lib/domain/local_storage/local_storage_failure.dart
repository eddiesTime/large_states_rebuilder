import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'local_storage_failure.freezed.dart';

@freezed
abstract class LocalStorageFailure<T> with _$LocalStorageFailure<T> {
  const factory LocalStorageFailure.noDataStored() = NoDataStored<T>;
}
