import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/share/ui/domain/repositories/ui_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUserUsecase {
  final UiRepository uiRepository;

  LogoutUserUsecase({required this.uiRepository});

  Future<Either<Failure, bool>> call() async {
    return await uiRepository.logoutUser();
  }
}
