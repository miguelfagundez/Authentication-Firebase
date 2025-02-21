part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool isAuthenticated;
  final User? user;
  const UserState({this.isAuthenticated = false, this.user});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(isAuthenticated: false);
}

class UserAuthenticateFailureState extends UserState {
  const UserAuthenticateFailureState() : super(isAuthenticated: false);
}

class UserAuthenticateSuccessfulState extends UserState {
  final User authenticatedUser;
  const UserAuthenticateSuccessfulState(this.authenticatedUser)
    : super(isAuthenticated: true, user: authenticatedUser);
}
