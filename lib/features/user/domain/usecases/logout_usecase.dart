import 'package:dartz/dartz.dart';

import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/features/user/domain/repositories/user_repository.dart';

class LogoutUseCase {
  final UserRepository userRepository;

  LogoutUseCase({required this.userRepository});

  Future<Either<Failure, bool>> call() async {
    return await userRepository.logoutUser();
  }
}
