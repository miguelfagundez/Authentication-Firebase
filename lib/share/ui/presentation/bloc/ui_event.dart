part of 'ui_bloc.dart';

@immutable
abstract class UiEvent {}

class InitialUiEvent extends UiEvent {
  InitialUiEvent();
}

class LogoutUserEvent extends UiEvent {
  LogoutUserEvent();
}
