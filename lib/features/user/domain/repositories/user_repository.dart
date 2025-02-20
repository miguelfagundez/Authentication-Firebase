import 'package:dartz/dartz.dart';

import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/features/user/domain/entities/user.dart';

abstract class UserRepository {
  // Register a new user using email/password
  Future<Either<Failure, bool>> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  );

  // Authenticate an existing user
  Future<Either<Failure, User>> authenticateUserWithEmail(
    String email,
    String password,
  );

  // Change password
  Future<Either<Failure, bool>> changePassword(String email);
}
