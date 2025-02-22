part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class InitialUserEvent extends UserEvent {
  InitialUserEvent();
}

class AuthenticateUserWithEmailEvent extends UserEvent {
  final String email;
  final String password;

  AuthenticateUserWithEmailEvent({required this.email, required this.password});
}

class RegisterUserWithEmailEvent extends UserEvent {
  final String email;
  final String password;

  RegisterUserWithEmailEvent({required this.email, required this.password});
}

class ChangePasswordEvent extends UserEvent {
  final String email;

  ChangePasswordEvent({required this.email});
}

class LogoutUserEvent extends UserEvent {
  LogoutUserEvent();
}
