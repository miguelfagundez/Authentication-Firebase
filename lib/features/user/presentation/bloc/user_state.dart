part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool isAuthenticated;
  final MyUser? user;
  final bool? passwordChanged;
  const UserState({
    this.isAuthenticated = false,
    this.user,
    this.passwordChanged,
  });
}

class UserInitialState extends UserState {
  const UserInitialState() : super(isAuthenticated: false, user: null);
}

class UserAuthenticateFailureState extends UserState {
  const UserAuthenticateFailureState()
    : super(isAuthenticated: false, user: null);
}

class UserAuthenticateSuccessfulState extends UserState {
  final MyUser authenticatedUser;
  const UserAuthenticateSuccessfulState(this.authenticatedUser)
    : super(isAuthenticated: true, user: authenticatedUser);
}

class LogoutUserState extends UserState {
  const LogoutUserState()
    : super(isAuthenticated: false, user: null, passwordChanged: false);
}
