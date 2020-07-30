import 'package:large_states_rebuilder/domain/authentication/user_entity.dart';
import 'package:large_states_rebuilder/domain/authentication/value_objects.dart';
import 'package:large_states_rebuilder/domain/core/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User Entity', () {
    test('should check whether factory constructor is working correctly', () {
      final UserEntity _userEntity = UserEntity(
        id: UniqueId(),
        name: StringSingleLine('Foo'),
        emailAddress: EmailAddress('tester.test@test.com'),
      );
      expect(_userEntity.id, isA<UniqueId>());
      expect(_userEntity.name, isA<StringSingleLine>());
      expect(_userEntity.emailAddress, isA<EmailAddress>());
    });
  });
}
