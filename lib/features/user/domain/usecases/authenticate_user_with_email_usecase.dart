import 'package:dartz/dartz.dart';

import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/features/user/domain/entities/user.dart';
import 'package:authentication_firebase/features/user/domain/repositories/user_repository.dart';

class AuthenticateUserWithEmailUsecase {
  final UserRepository userRepository;

  AuthenticateUserWithEmailUsecase({required this.userRepository});

  Future<Either<Failure, User>> call(String email, String password) async {
    return await userRepository.authenticateUserWithEmail(email, password);
  }
}
