import 'package:get_it/get_it.dart';
import 'package:authentication_firebase/features/user/presentation/bloc/user_bloc.dart';
import 'package:authentication_firebase/features/user/data/datasources/user_datasource.dart';
import 'package:authentication_firebase/features/user/domain/repositories/user_repository.dart';
import 'package:authentication_firebase/features/user/domain/usecases/register_user_usecase.dart';
import 'package:authentication_firebase/features/user/data/repositories/user_repository_impl.dart';
import 'package:authentication_firebase/features/user/domain/usecases/change_password_usecase.dart';
import 'package:authentication_firebase/features/user/domain/usecases/authenticate_user_with_email_usecase.dart';

final di = GetIt.instance;

Future<void> init() async {
  // --- bloc register ---
  di.registerFactory(() => UserBloc(di()));

  // --- usecases ---
  // User
  di.registerLazySingleton(
    () => AuthenticateUserWithEmailUsecase(userRepository: di()),
  );
  di.registerLazySingleton(() => ChangePasswordUsecase(userRepository: di()));
  di.registerLazySingleton(() => RegisterUserUsecase(userRepository: di()));

  // --- repository ---
  di.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userFirebaseDatasource: di()),
  );

  // --- datasources ---
  di.registerLazySingleton<UserFirebaseDataSource>(
    () => UserFirebaseDatasourceImpl(),
  );
}
