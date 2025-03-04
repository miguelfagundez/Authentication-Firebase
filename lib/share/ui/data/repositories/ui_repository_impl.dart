import 'package:authentication_firebase/core/errors/failures.dart';
import 'package:authentication_firebase/share/ui/data/datasources/ui_datasource.dart';
import 'package:authentication_firebase/share/ui/domain/repositories/ui_repository.dart';
import 'package:dartz/dartz.dart';

class UiRepositoryImpl implements UiRepository {
  // --------------------------------
  // Need to be implemented
  // --------------------------------
  final UiDataSourceImpl uiDatasource;

  UiRepositoryImpl({required this.uiDatasource});

  @override
  Future<Either<Failure, bool>> logoutUser() async {
    // TODO: implement logoutUser
    try {
      final bool logoutResult = await uiDatasource.logoutUser();
      return Right(logoutResult);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString(), code: '400'));
    }
  }
}
