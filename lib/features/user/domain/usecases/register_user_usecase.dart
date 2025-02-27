import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/features/user/domain/entities/user.dart';
import 'package:authentication_firebase/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUserUsecase {
  final UserRepository userRepository;

  RegisterUserUsecase({required this.userRepository});

  Future<Either<Failure, MyUser>> call(
    String name,
    String email,
    String password,
    DateTime time,
  ) async {
    return await userRepository.registerUser(name, email, password, time);
  }
}
