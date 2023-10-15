import 'package:ai_client/data/repositories/models_repository_impl.dart';
import 'package:ai_client/data/services/models_service.dart';
import 'package:ai_client/domain/repositories/models_repository.dart';
import 'package:ai_client/domain/usecases/create_element.dart';
import 'package:ai_client/domain/usecases/get_elements.dart';
import 'package:ai_client/domain/usecases/get_models.dart';
import 'package:ai_client/presentation/bloc/elements/remote_elements_bloc.dart';
import 'package:ai_client/presentation/bloc/models/remote_model_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Services
  sl.registerSingleton<ModelsService>(ModelsService(sl()));


  // Repositories
  sl.registerSingleton<ModelRepository>(
    ModelRepositoryImpl(sl())
  );
  
  // UseCases
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
  sl.registerFactory<RemoteModelsBloc>(
    () => RemoteModelsBloc(sl())
  );
  sl.registerFactory<RemoteElementsBloc>(
    ()=> RemoteElementsBloc(sl())
  );
}
