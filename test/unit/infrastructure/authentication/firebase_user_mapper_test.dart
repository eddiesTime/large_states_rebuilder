import 'package:firebase_auth/firebase_auth.dart';
import 'package:large_states_rebuilder/domain/authentication/user_entity.dart';
import 'package:large_states_rebuilder/domain/authentication/value_objects.dart';
import 'package:large_states_rebuilder/domain/core/value_object.dart';
import 'package:large_states_rebuilder/infrastructure/authentication/firebase_user_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseUser extends Mock implements FirebaseUser {
  @override
  final String uid;
  @override
  final String displayName;
  @override
  final String email;

  MockFirebaseUser(this.uid, this.displayName, this.email);
}

void main() {
  FirebaseUser _user;
  FirebaseUserMapper _userMapper;
  group('Firebase User Mapper', () {
    setUp(() {
      _user = MockFirebaseUser('1234567', 'Foobar', 'foo.bar@test.com');
      _userMapper = FirebaseUserMapper();
    });
    test(
        'should check whether toDomain() is working correctly for existing user',
        () {
      final UserEntity _mockUser = UserEntity(
          id: UniqueId.fromUniqueString(_user.uid),
          emailAddress: EmailAddress(_user.email),
          name: StringSingleLine(_user.displayName));
      expect(_userMapper.toDomain(_user), _mockUser);
    });
    test(
        'should check whether toDomain() is working correctly for non-existent user',
        () {
      expect(_userMapper.toDomain(null), isNull);
    });
  });
}
