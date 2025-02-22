import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/features/user/data/datasources/user_datasource.dart';
import 'package:authentication_firebase/features/user/domain/entities/user.dart';
import 'package:authentication_firebase/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  // --------------------------------
  // Need to be implemented
  // --------------------------------
  final UserFirebaseDataSourceImpl userFirebaseDatasource;

  UserRepositoryImpl({required this.userFirebaseDatasource});

  @override
  Future<Either<Failure, User>> authenticateUserWithEmail(
    String email,
    String password,
  ) async {
    try {
      final User user = await userFirebaseDatasource.authenticateUserWithEmail(
        email,
        password,
      );
      return Right(user);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString(), code: '400'));
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword(String email) async {
    try {
      final bool result = await userFirebaseDatasource.changePassword(email);
      return Right(result);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString(), code: '400'));
    }
  }

  @override
  Future<Either<Failure, User>> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  ) async {
    try {
      final User result = await userFirebaseDatasource.registerUser(
        name,
        email,
        password,
        time,
      );
      return Right(result);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString(), code: '400'));
    }
  }

  @override
  Future<Either<Failure, bool>> logoutUser() async {
    try {
      final bool result = await userFirebaseDatasource.logoutUser();
      return Right(result);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString(), code: '400'));
    }
  }
}
