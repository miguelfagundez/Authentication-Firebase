part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final MyUser? user;
  final bool? passwordChanged;
  const UserState({this.user, this.passwordChanged});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(user: null);
}

class UserAuthenticateFailureState extends UserState {
  const UserAuthenticateFailureState() : super(user: null);
}

class UserAuthenticateSuccessfulState extends UserState {
  final MyUser authenticatedUser;
  const UserAuthenticateSuccessfulState(this.authenticatedUser)
    : super(user: authenticatedUser);
}
