import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/app/util/usecase.dart';
import 'package:ai_client/domain/entities/general.dart';
import 'package:ai_client/domain/repositories/models_repository.dart';

class GetElementsUseCase implements UseCase<DataState<List<GeneralEntity>>,Map<String, dynamic>>{
  
  final ModelRepository _modelRepository;

  GetElementsUseCase(this._modelRepository);
  
  @override
  Future<DataState<List<GeneralEntity>>> call({Map<String, dynamic> ? params}) {
    return _modelRepository.getElements(params!['model'], params['jsonSchema']);
  }
  
}
