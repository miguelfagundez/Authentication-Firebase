part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool isAuthenticated;
  final User? user;
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
  final User authenticatedUser;
  const UserAuthenticateSuccessfulState(this.authenticatedUser)
    : super(isAuthenticated: true, user: authenticatedUser);
}
