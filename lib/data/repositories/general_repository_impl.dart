import 'dart:io';
import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/data/services/general_service.dart';
import 'package:ai_client/domain/repositories/general_repository.dart';
import 'package:dio/dio.dart';

class GeneralRepositoryImpl<T> implements GeneralRepository {
  final GeneralService<T> _generalService;

  GeneralRepositoryImpl(this._generalService);

  @override
  Future<DataState<List<T>>> getItems() async {
    try {
      final httpResponse = await _generalService.getItems(T.toString().toLowerCase());

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<T> typedData = (httpResponse.data).cast<T>();
        return DataSuccess(typedData);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions
          )
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }
  
}
