import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/app/util/usecase.dart';
import 'package:ai_client/domain/repositories/models_repository.dart';

class CreateElementUseCase implements UseCase<DataState<dynamic>,Map<String, dynamic>>{
  
  final ModelRepository _modelRepository;

  CreateElementUseCase(this._modelRepository);
  
  @override
  Future<DataState<dynamic>> call({Map<String, dynamic> ? params}) {
    final String model = params!['model'];
    final Map<String, dynamic>? requestBody = params['requestBody'];
    return _modelRepository.createElement(model, requestBody!);
  }
  
}
