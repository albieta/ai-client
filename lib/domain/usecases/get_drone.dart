import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/app/util/usecase.dart';
import 'package:ai_client/domain/repositories/drone_repository.dart';
import 'package:ai_client/domain/entities/drone.dart';

class GetDroneUseCase implements UseCase<DataState<List<DroneEntity>>,void>{
  
  final DroneRepository _droneRepository;

  GetDroneUseCase(this._droneRepository);
  
  @override
  Future<DataState<List<DroneEntity>>> call({void params}) {
    return _droneRepository.getDrones();
  }
  
}
