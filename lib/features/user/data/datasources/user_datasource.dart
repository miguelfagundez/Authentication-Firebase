import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/features/user/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class UserFirebaseDataSource {
  Future<User> authenticateUserWithEmail(String email, String password);
  Future<User?> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  );
  Future<bool> changePassword(String email);
}

// --------------------------------
// Need to be implemented
// --------------------------------
class UserFirebaseDatasourceImpl implements UserFirebaseDataSource {
  // Register a new user using email/password
  @override
  Future<User> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  ) async {
    // HERE: Firebase call
    return User(
      id: 'id',
      name: 'name',
      email: 'email',
      password: 'password',
      createAt: DateTime.now(),
    );
  }

  // Authenticate an existing user
  @override
  Future<User> authenticateUserWithEmail(String email, String password) async {
    try {
      // HERE: Firebase call
      final User user = User(
        id: "1",
        name: 'name',
        email: 'email@email.com',
        password: 'password123',
        createAt: DateTime.now(),
      );
      return user;
    } catch (error) {
      debugPrint(error.toString());
      throw (FirebaseFailure(message: error.toString(), code: '400'));
    }
  }

  // Change password
  @override
  Future<bool> changePassword(String email) async {
    // HERE: Firebase call
    return false;
  }
}
