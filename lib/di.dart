import 'package:authentication_firebase/features/user/domain/usecases/change_password_usecase.dart';
import 'package:authentication_firebase/features/user/domain/usecases/logout_usecase.dart';
import 'package:authentication_firebase/features/user/domain/usecases/register_user_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:authentication_firebase/features/user/presentation/bloc/user_bloc.dart';
import 'package:authentication_firebase/features/user/data/datasources/user_datasource.dart';
import 'package:authentication_firebase/features/user/domain/repositories/user_repository.dart';
// import 'package:authentication_firebase/features/user/domain/usecases/register_user_usecase.dart';
import 'package:authentication_firebase/features/user/data/repositories/user_repository_impl.dart';
// import 'package:authentication_firebase/features/user/domain/usecases/change_password_usecase.dart';
import 'package:authentication_firebase/features/user/domain/usecases/authenticate_user_with_email_usecase.dart';

final di = GetIt.instance;

Future<void> initServices() async {
  // ------------------- BEGIN: UserBloc -------------------
  final UserFirebaseDataSourceImpl userFirebaseDataSource = di
      .registerSingleton(UserFirebaseDataSourceImpl());

  final UserRepositoryImpl userRepositoryImpl = di.registerSingleton(
    UserRepositoryImpl(userFirebaseDatasource: userFirebaseDataSource),
  );

  final AuthenticateUserWithEmailUsecase authenticateUserWithEmailUsecase = di
      .registerSingleton(
        AuthenticateUserWithEmailUsecase(userRepository: userRepositoryImpl),
      );
  final ChangePasswordUsecase changePasswordUsecase = di.registerSingleton(
    ChangePasswordUsecase(userRepository: userRepositoryImpl),
  );
  final RegisterUserUsecase registerUserUsecase = di.registerSingleton(
    RegisterUserUsecase(userRepository: userRepositoryImpl),
  );

  final LogoutUseCase logoutUserUsecase = di.registerSingleton(
    LogoutUseCase(userRepository: userRepositoryImpl),
  );

  di.registerFactory(
    () => UserBloc(
      authenticateUserWithEmailUsecase,
      changePasswordUsecase,
      registerUserUsecase,
      logoutUserUsecase,
    ),
  );
  // ------------------- END: UserBloc -------------------

  // -----------------------------------------------
  // --- bloc register ---
  // di.registerFactory(() => UserBloc(di(), di(), di()));

  // // --- usecases ---
  // // User
  // di.registerLazySingleton(
  //   () => AuthenticateUserWithEmailUsecase(userRepository: di()),
  // );
  // di.registerLazySingleton(() => ChangePasswordUsecase(userRepository: di()));
  // di.registerLazySingleton(() => RegisterUserUsecase(userRepository: di()));

  // // --- repository ---
  // di.registerLazySingleton<UserRepository>(
  //   () => UserRepositoryImpl(userFirebaseDatasource: di()),
  // );

  // // --- datasources ---
  // di.registerLazySingleton<UserFirebaseDataSource>(
  //   () => UserFirebaseDataSourceImpl(),
  // );
}
