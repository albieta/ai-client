import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/app/util/usecase.dart';
import 'package:ai_client/domain/repositories/general_repository.dart';

class GetItemUseCase<T> implements UseCase<DataState<List<T>>,void>{
  
  final GeneralRepository<T> _generalRepository;

  GetItemUseCase(this._generalRepository);
  
  @override
  Future<DataState<List<T>>> call({void params}) {
    return _generalRepository.getItems();
  }
}
