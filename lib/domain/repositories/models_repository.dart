import 'package:ai_client/app/util/data_state.dart';

abstract class ModelRepository {
  // API methods
  Future<DataState<List<dynamic>>> getModels();

  Future<DataState<dynamic>> createElement(String model, Map<String, dynamic> requestBody);
}
