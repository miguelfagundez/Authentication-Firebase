part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final AuthStatus authStatus;

  const AuthState({required this.authStatus});
}

class UserInitialState extends AuthState {
  const UserInitialState() : super(authStatus: AuthStatus.unaunthenticated);
}

class UserAuthenticateFailureState extends AuthState {
  const UserAuthenticateFailureState()
    : super(authStatus: AuthStatus.unaunthenticated);
}

class UserAuthenticateSuccessfulState extends AuthState {
  const UserAuthenticateSuccessfulState()
    : super(authStatus: AuthStatus.authenticated);
}
