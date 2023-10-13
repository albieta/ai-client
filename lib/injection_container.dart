import 'package:ai_client/data/repositories/drone_repository_impl.dart';
import 'package:ai_client/data/repositories/general_repository_impl.dart';
import 'package:ai_client/data/repositories/user_repository_impl.dart';
import 'package:ai_client/data/services/drone_service.dart';
import 'package:ai_client/data/services/general_service.dart';
import 'package:ai_client/data/services/user_service.dart';
import 'package:ai_client/domain/entities/user.dart';
import 'package:ai_client/domain/repositories/drone_repository.dart';
import 'package:ai_client/domain/repositories/general_repository.dart';
import 'package:ai_client/domain/repositories/user_repository.dart';
import 'package:ai_client/domain/usecases/get_drone.dart';
import 'package:ai_client/domain/usecases/get_item.dart';
import 'package:ai_client/domain/usecases/get_user.dart';
import 'package:ai_client/presentation/bloc/drones/remote_drone_bloc.dart';
import 'package:ai_client/presentation/bloc/items/remote_item_bloc.dart';
import 'package:ai_client/presentation/bloc/users/remote_user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Services
  sl.registerSingleton<UsersService>(UsersService(sl()));
  sl.registerSingleton<DronesService>(DronesService(sl()));
  sl.registerSingleton<GeneralService<UserEntity>>(GeneralService<UserEntity>(sl()));

  // Repositories
  sl.registerSingleton<UserRepository>(
    UserRepositoryImpl(sl())
  );
  sl.registerSingleton<DroneRepository>(
    DroneRepositoryImpl(sl())
  );
  sl.registerSingleton<GeneralRepository>(
    GeneralRepositoryImpl<UserEntity>(sl())
  );
  
  // UseCases
  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase(sl())
  );
  sl.registerSingleton<GetDroneUseCase>(
    GetDroneUseCase(sl())
  );
  sl.registerSingleton<GetItemUseCase>(
    GetItemUseCase(sl())
  );

  // Blocs
  sl.registerFactory<RemoteUsersBloc>(
    ()=> RemoteUsersBloc(sl())
  );
  sl.registerFactory<RemoteDronesBloc>(
    ()=> RemoteDronesBloc(sl())
  );
  sl.registerFactory<RemoteItemsBloc>(
    ()=> RemoteItemsBloc(sl())
  );
}
