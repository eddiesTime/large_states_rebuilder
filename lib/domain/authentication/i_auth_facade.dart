import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:large_states_rebuilder/domain/authentication/auth_failure.dart';
import 'package:large_states_rebuilder/domain/authentication/user_entity.dart';
import 'package:large_states_rebuilder/domain/authentication/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<UserEntity>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
