import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/domain/entities/general.dart';

abstract class ModelRepository {
  // API methods
  Future<DataState<List<dynamic>>> getModels();

  Future<DataState<List<GeneralEntity>>> getElements(String model, dynamic jsonSchema);

  Future<DataState<dynamic>> createElement(String model, Map<String, dynamic> requestBody);
}
