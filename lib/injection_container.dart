import 'package:ai_client/data/repositories/drone_repository_impl.dart';
import 'package:ai_client/data/repositories/models_repository_impl.dart';
import 'package:ai_client/data/repositories/user_repository_impl.dart';
import 'package:ai_client/data/services/drone_service.dart';
import 'package:ai_client/data/services/models_service.dart';
import 'package:ai_client/data/services/user_service.dart';
import 'package:ai_client/domain/repositories/drone_repository.dart';
import 'package:ai_client/domain/repositories/models_repository.dart';
import 'package:ai_client/domain/repositories/user_repository.dart';
import 'package:ai_client/domain/usecases/create_element.dart';
import 'package:ai_client/domain/usecases/get_drone.dart';
import 'package:ai_client/domain/usecases/get_elements.dart';
import 'package:ai_client/domain/usecases/get_models.dart';
import 'package:ai_client/domain/usecases/get_user.dart';
import 'package:ai_client/presentation/bloc/drones/remote_drone_bloc.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_bloc.dart';
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
  sl.registerSingleton<ModelsService>(ModelsService(sl()));


  // Repositories
  sl.registerSingleton<UserRepository>(
    UserRepositoryImpl(sl())
  );
  sl.registerSingleton<DroneRepository>(
    DroneRepositoryImpl(sl())
  );
  sl.registerSingleton<ModelRepository>(
    ModelRepositoryImpl(sl())
  );
  
  // UseCases
  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase(sl())
  );
  sl.registerSingleton<GetDroneUseCase>(
    GetDroneUseCase(sl())
  );
  sl.registerSingleton<GetModelUseCase>(
    GetModelUseCase(sl())
  );
  sl.registerSingleton<CreateElementUseCase>(
    CreateElementUseCase(sl())
  );
  sl.registerSingleton<GetElementsUseCase>(
    GetElementsUseCase(sl())
  );

  // Blocs
  sl.registerFactory<RemoteUsersBloc>(
    ()=> RemoteUsersBloc(sl())
  );
  sl.registerFactory<RemoteDronesBloc>(
    ()=> RemoteDronesBloc(sl())
  );
  sl.registerFactory<RemoteModelsBloc>(() => RemoteModelsBloc(
    sl<GetModelUseCase>(), 
    sl<GetElementsUseCase>(),
  ));
}
