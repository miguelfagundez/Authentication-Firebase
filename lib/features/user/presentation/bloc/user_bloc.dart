import 'package:authentication_firebase/features/user/domain/entities/user.dart';
import 'package:authentication_firebase/features/user/domain/usecases/authenticate_user_with_email_usecase.dart';
import 'package:authentication_firebase/features/user/domain/usecases/change_password_usecase.dart';
import 'package:authentication_firebase/features/user/domain/usecases/register_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthenticateUserWithEmailUsecase _authenticateUserWithEmailUsecase;
  // final ChangePasswordUsecase _changePasswordUsecase;
  // final RegisterUserUsecase _registerUserUsecase;

  UserBloc(
    this._authenticateUserWithEmailUsecase,
    // this._changePasswordUsecase,
    // this._registerUserUsecase,
  ) : super(UserInitialState()) {
    on<AuthenticateUserWithEmailEvent>(_authenticateUserWithEmailEvent);
  }

  _authenticateUserWithEmailEvent(
    AuthenticateUserWithEmailEvent event,
    Emitter<UserState> emit,
  ) async {
    final resp = await _authenticateUserWithEmailUsecase(
      event.email,
      event.password,
    );

    resp.fold(
      (userAuthenticatedFailure) {
        debugPrint('User was not Authenticated - Try Again!');
        emit(UserAuthenticateFailureState());
      },
      (userAuthenticatedSuccess) {
        debugPrint(
          'User was Authenticated successfully, ${userAuthenticatedSuccess.email}',
        );
        //add(SomeUserEvent());
        emit(UserAuthenticateSuccessfulState(userAuthenticatedSuccess));
      },
    );
  }
}
