import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/features/user/domain/entities/user.dart'
    as myUser;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class UserFirebaseDataSource {
  Future<myUser.User> authenticateUserWithEmail(String email, String password);
  Future<myUser.User?> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  );
  Future<bool> changePassword(String email);
  Future<bool> logoutUser();
}

// --------------------------------
// Need to be implemented
// --------------------------------
class UserFirebaseDataSourceImpl implements UserFirebaseDataSource {
  // Register a new user using email/password
  @override
  Future<myUser.User> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  ) async {
    // HERE: Firebase call
    return myUser.User(
      id: 'id',
      name: 'name',
      email: 'email',
      password: 'password',
      createAt: DateTime.now(),
    );
  }

  // Authenticate an existing user
  @override
  Future<myUser.User> authenticateUserWithEmail(
    String email,
    String password,
  ) async {
    try {
      debugPrint(email);
      debugPrint(password);
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      debugPrint(credentials.user?.uid);

      // HERE: Firebase call
      if (password == 'password123') {
        final myUser.User user = myUser.User(
          id: "1",
          name: 'name',
          email: 'email@email.com',
          password: 'password123',
          createAt: DateTime.now(),
        );
        return user;
      } else {
        throw FormatException('Error - Wrong password. Try again.');
      }
    } catch (error) {
      if (kDebugMode) {
        debugPrint(error.toString());
      }
      throw (FirebaseFailure(message: error.toString(), code: '400'));
    }
  }

  // Change password
  @override
  Future<bool> changePassword(String email) async {
    // HERE: Firebase call
    return false;
  }

  @override
  Future<bool> logoutUser() async {
    // HERE: Firebase call
    debugPrint('User was logout successfully');
    return true;
  }
}
