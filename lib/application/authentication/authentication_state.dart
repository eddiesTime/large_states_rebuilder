part of 'authentication_store.dart';

@lazySingleton
@freezed
abstract class AuthenticationState with _$AuthenticationState {
  @factoryMethod
  const factory AuthenticationState.initial() = Initial;
  const factory AuthenticationState.authenticated(UserEntity user) =
      Authenticated;
  const factory AuthenticationState.unauthenticated() = Unauthenticated;
}
