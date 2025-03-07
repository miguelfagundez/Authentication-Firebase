import 'package:authentication_firebase/core/utils/enums.dart';
import 'package:authentication_firebase/share/ui/domain/usecases/logout_user_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  final LogoutUserUsecase _logoutUserUsecase;

  UiBloc(this._logoutUserUsecase) : super(InitialUiState()) {
    on<LogoutUserEvent>(_logoutUserEvent);
  }

  _logoutUserEvent(LogoutUserEvent event, Emitter<UiState> emit) async {
    final resp = await _logoutUserUsecase();

    resp.fold(
      (userWasNotLogout) {
        debugPrint('User was not logout - Try Again!');
        // Do Nothing
      },
      (userWasLogout) {
        debugPrint('User was logout successfully, $userWasLogout');
        emit(LogoutUserState());
        //add(SomeUserEvent());
        //emit();
      },
    );
  }
}
