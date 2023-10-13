import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/domain/entities/drone.dart';

abstract class DroneRepository {
  // API methods
  Future<DataState<List<DroneEntity>>> getDrones();
}
