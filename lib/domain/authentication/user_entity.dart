import 'package:large_states_rebuilder/domain/authentication/value_objects.dart';
import 'package:large_states_rebuilder/domain/core/entity.dart';
import 'package:large_states_rebuilder/domain/core/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity implements IEntity {
  const factory UserEntity({
    @required UniqueId id,
    @required StringSingleLine name,
    @required EmailAddress emailAddress,
  }) = _UserEntity;
}
