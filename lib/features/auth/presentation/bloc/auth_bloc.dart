import 'dart:async';

import 'package:authentication_firebase/core/utils/enums.dart';
import 'package:authentication_firebase/features/user/domain/entities/user.dart';
import 'package:authentication_firebase/features/user/domain/usecases/authenticate_user_with_email_usecase.dart';
import 'package:authentication_firebase/features/user/domain/usecases/change_password_usecase.dart';
import 'package:authentication_firebase/features/user/domain/usecases/logout_usecase.dart';
import 'package:authentication_firebase/features/user/domain/usecases/register_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUserWithEmailUsecase _authenticateUserWithEmailUsecase;
  final ChangePasswordUsecase _changePasswordUsecase;
  final RegisterUserUsecase _registerUserUsecase;
  // final LogoutUseCase _logoutUsecase;

  AuthBloc(
    this._authenticateUserWithEmailUsecase,
    this._changePasswordUsecase,
    this._registerUserUsecase,
    // this._logoutUsecase,
  ) : super(UserInitialState()) {
    on<AuthenticateUserWithEmailEvent>(_authenticateUserWithEmailEvent);
    on<RegisterUserWithEmailEvent>(_registerUserEvent);
    on<ChangePasswordEvent>(_changePasswordEvent);
    // on<LogoutUserEvent>(_logoutUserEvent);
  }

  _changePasswordEvent(
    ChangePasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    final resp = await _changePasswordUsecase(event.email);

    resp.fold(
      (userAuthenticatedFailure) {
        debugPrint('Password was not changed - Try Again!');
        emit(UserAuthenticateFailureState());
      },
      (passwordChangedSuccess) {
        debugPrint(
          'Password was changed successfully, $passwordChangedSuccess',
        );
        //add(SomeUserEvent());
        //emit();
      },
    );
  }

  // TODO THIS SHOULD BE IN UI BLOC
  _registerUserEvent(
    RegisterUserWithEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    final resp = await _registerUserUsecase(
      event.email,
      event.email,
      event.password,
      DateTime.now(),
    );

    resp.fold(
      (userAuthenticatedFailure) {
        debugPrint('User was not Register - Try Again!');
        emit(UserAuthenticateFailureState());
      },
      (userAuthenticatedSuccess) {
        debugPrint(
          'User was Authenticated successfully, ${userAuthenticatedSuccess.email}',
        );
        //add(SomeUserEvent());
        // TODO Save User Data
        emit(UserAuthenticateSuccessfulState());
      },
    );
  }

  _authenticateUserWithEmailEvent(
    AuthenticateUserWithEmailEvent event,
    Emitter<AuthState> emit,
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
        // TODO Save User Data
        emit(UserAuthenticateSuccessfulState());
      },
    );
  }

  // FutureOr<void> _logoutUserEvent(
  //   LogoutUserEvent event,
  //   Emitter<UserState> emit,
  // ) async {
  //   final resp = await _logoutUsecase();

  //   resp.fold(
  //     (logoutUserFailure) {
  //       debugPrint('User cannot be logout - Try Again!');
  //       //emit(UserAuthenticateFailureState());
  //     },
  //     (logoutUserSuccess) {
  //       debugPrint('User was logout successfully');
  //       //add(SomeUserEvent());
  //       emit(LogoutUserState());
  //     },
  //   );
  // }
}
