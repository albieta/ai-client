import 'dart:io';
import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/data/services/models_service.dart';
import 'package:ai_client/domain/repositories/models_repository.dart';
import 'package:dio/dio.dart';

class ModelRepositoryImpl implements ModelRepository {
  final ModelsService _modelsService;

  ModelRepositoryImpl(this._modelsService);

  @override
  Future<DataState<List<dynamic>>> getModels() async {
    try {
      final httpResponse = await _modelsService.getModels();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
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

  @override
  Future<DataState<dynamic>> createElement(String model, Map<String, dynamic> requestBody) async {
    try {
      final httpResponse = await _modelsService.createElement(model, requestBody);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
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
