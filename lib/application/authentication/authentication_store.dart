import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:large_states_rebuilder/domain/authentication/i_auth_facade.dart';
import 'package:large_states_rebuilder/domain/authentication/user_entity.dart';

part 'authentication_state.dart';
part 'authentication_store.freezed.dart';

class AuthenticationStore {
  final IAuthFacade _authFacade;
  AuthenticationStore(this._authFacade);

  AuthenticationState _authenticationState;
  AuthenticationState get state => _authenticationState;

  Future<void> authCheckRequested() async {
    final userOption = await _authFacade.getSignedInUser();
    _authenticationState = userOption.fold(
      () => const AuthenticationState.unauthenticated(),
      (UserEntity user) => AuthenticationState.authenticated(user),
    );
  }

  Future<void> signOut() async {
    await _authFacade.signOut();
    _authenticationState = const AuthenticationState.unauthenticated();
  }
}
