import 'package:ai_client/app/util/data_state.dart';

abstract class GeneralRepository<T> {
  // API methods
  Future<DataState<List<T>>> getItems();
}
