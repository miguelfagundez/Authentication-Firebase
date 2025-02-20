import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUsecase {
  final UserRepository userRepository;

  ChangePasswordUsecase({required this.userRepository});

  Future<Either<Failure, bool>> call(String email) async {
    return await userRepository.changePassword(email);
  }
}
