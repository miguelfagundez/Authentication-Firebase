import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/features/user/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

// --------------------------------
// Need to be implemented
// --------------------------------
class UserDatasource {
  // Register a new user using email/password
  bool registerUser(String name, String email, String password, DateTime time) {
    return false;
  }

  // Authenticate an existing user
  Failure authenticateUserWithEmail(String email, String password) {
    return FirebaseFailure();
  }

  // Change password
  bool changePassword(String email) {
    return false;
  }
}
