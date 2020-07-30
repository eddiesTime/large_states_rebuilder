// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'local_storage_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LocalStorageFailureTearOff {
  const _$LocalStorageFailureTearOff();

// ignore: unused_element
  NoDataStored<T> noDataStored<T>() {
    return NoDataStored<T>();
  }
}

// ignore: unused_element
const $LocalStorageFailure = _$LocalStorageFailureTearOff();

mixin _$LocalStorageFailure<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noDataStored(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noDataStored(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noDataStored(NoDataStored<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noDataStored(NoDataStored<T> value),
    @required Result orElse(),
  });
}

abstract class $LocalStorageFailureCopyWith<T, $Res> {
  factory $LocalStorageFailureCopyWith(LocalStorageFailure<T> value,
          $Res Function(LocalStorageFailure<T>) then) =
      _$LocalStorageFailureCopyWithImpl<T, $Res>;
}

class _$LocalStorageFailureCopyWithImpl<T, $Res>
    implements $LocalStorageFailureCopyWith<T, $Res> {
  _$LocalStorageFailureCopyWithImpl(this._value, this._then);

  final LocalStorageFailure<T> _value;
  // ignore: unused_field
  final $Res Function(LocalStorageFailure<T>) _then;
}

abstract class $NoDataStoredCopyWith<T, $Res> {
  factory $NoDataStoredCopyWith(
          NoDataStored<T> value, $Res Function(NoDataStored<T>) then) =
      _$NoDataStoredCopyWithImpl<T, $Res>;
}

class _$NoDataStoredCopyWithImpl<T, $Res>
    extends _$LocalStorageFailureCopyWithImpl<T, $Res>
    implements $NoDataStoredCopyWith<T, $Res> {
  _$NoDataStoredCopyWithImpl(
      NoDataStored<T> _value, $Res Function(NoDataStored<T>) _then)
      : super(_value, (v) => _then(v as NoDataStored<T>));

  @override
  NoDataStored<T> get _value => super._value as NoDataStored<T>;
}

class _$NoDataStored<T>
    with DiagnosticableTreeMixin
    implements NoDataStored<T> {
  const _$NoDataStored();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalStorageFailure<$T>.noDataStored()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'LocalStorageFailure<$T>.noDataStored'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoDataStored<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noDataStored(),
  }) {
    assert(noDataStored != null);
    return noDataStored();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noDataStored(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noDataStored != null) {
      return noDataStored();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noDataStored(NoDataStored<T> value),
  }) {
    assert(noDataStored != null);
    return noDataStored(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noDataStored(NoDataStored<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noDataStored != null) {
      return noDataStored(this);
    }
    return orElse();
  }
}

abstract class NoDataStored<T> implements LocalStorageFailure<T> {
  const factory NoDataStored() = _$NoDataStored<T>;
}
