import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/app/util/usecase.dart';
import 'package:ai_client/domain/repositories/models_repository.dart';

class GetModelUseCase implements UseCase<DataState<dynamic>,void>{
  
  final ModelRepository _modelRepository;

  GetModelUseCase(this._modelRepository);
  
  @override
  Future<DataState<List<dynamic>>> call({void params}) {
    return _modelRepository.getModels();
  }
  
}
