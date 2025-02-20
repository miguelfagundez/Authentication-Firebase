import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/features/user/data/datasources/user_datasource.dart';
import 'package:authentication_firebase/features/user/domain/entities/user.dart';
import 'package:authentication_firebase/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  // --------------------------------
  // Need to be implemented
  // --------------------------------
  final UserDatasource userDatasource;

  UserRepositoryImpl({required this.userDatasource});

  @override
  Future<Either<Failure, User>> authenticateUserWithEmail(
    String email,
    String password,
  ) async {
    try {
      final User user = User(
        id: "1",
        name: 'name',
        email: 'email',
        password: 'password',
        createAt: DateTime.now(),
      );
      return Right(user);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword(String email) async {
    try {
      final bool result = true;
      return Right(result);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  ) async {
    try {
      final bool result = true;
      return Right(result);
    } catch (e) {
      return Left(FirebaseFailure());
    }
  }
}
