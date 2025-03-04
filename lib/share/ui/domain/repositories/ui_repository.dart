import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UiRepository {
  // LogoutUser
  Future<Either<Failure, bool>> logoutUser();
}
