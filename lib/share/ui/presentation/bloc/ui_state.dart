part of 'ui_bloc.dart';

@immutable
abstract class UiState {
  final bool isAuthenticated;
  const UiState({this.isAuthenticated = false});
}

class InitialUiState extends UiState {
  const InitialUiState() : super(isAuthenticated: false);
}

class LogoutUserState extends UiState {
  const LogoutUserState() : super(isAuthenticated: false);
}
