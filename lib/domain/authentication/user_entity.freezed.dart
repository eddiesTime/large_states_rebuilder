// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserEntityTearOff {
  const _$UserEntityTearOff();

// ignore: unused_element
  _UserEntity call(
      {@required UniqueId id,
      @required StringSingleLine name,
      @required EmailAddress emailAddress}) {
    return _UserEntity(
      id: id,
      name: name,
      emailAddress: emailAddress,
    );
  }
}

// ignore: unused_element
const $UserEntity = _$UserEntityTearOff();

mixin _$UserEntity {
  UniqueId get id;
  StringSingleLine get name;
  EmailAddress get emailAddress;

  $UserEntityCopyWith<UserEntity> get copyWith;
}

abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res>;
  $Res call({UniqueId id, StringSingleLine name, EmailAddress emailAddress});
}

class _$UserEntityCopyWithImpl<$Res> implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  final UserEntity _value;
  // ignore: unused_field
  final $Res Function(UserEntity) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object emailAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as StringSingleLine,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as EmailAddress,
    ));
  }
}

abstract class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(
          _UserEntity value, $Res Function(_UserEntity) then) =
      __$UserEntityCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, StringSingleLine name, EmailAddress emailAddress});
}

class __$UserEntityCopyWithImpl<$Res> extends _$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(
      _UserEntity _value, $Res Function(_UserEntity) _then)
      : super(_value, (v) => _then(v as _UserEntity));

  @override
  _UserEntity get _value => super._value as _UserEntity;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object emailAddress = freezed,
  }) {
    return _then(_UserEntity(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as StringSingleLine,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as EmailAddress,
    ));
  }
}

class _$_UserEntity implements _UserEntity {
  const _$_UserEntity(
      {@required this.id, @required this.name, @required this.emailAddress})
      : assert(id != null),
        assert(name != null),
        assert(emailAddress != null);

  @override
  final UniqueId id;
  @override
  final StringSingleLine name;
  @override
  final EmailAddress emailAddress;

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, emailAddress: $emailAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(emailAddress);

  @override
  _$UserEntityCopyWith<_UserEntity> get copyWith =>
      __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {@required UniqueId id,
      @required StringSingleLine name,
      @required EmailAddress emailAddress}) = _$_UserEntity;

  @override
  UniqueId get id;
  @override
  StringSingleLine get name;
  @override
  EmailAddress get emailAddress;
  @override
  _$UserEntityCopyWith<_UserEntity> get copyWith;
}
