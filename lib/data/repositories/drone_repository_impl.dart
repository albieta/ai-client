import 'dart:io';
import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/data/models/drone_model.dart';
import 'package:ai_client/domain/repositories/drone_repository.dart';
import 'package:ai_client/data/services/drone_service.dart';
import 'package:dio/dio.dart';

class DroneRepositoryImpl implements DroneRepository {
  final DronesService _dronesService;

  DroneRepositoryImpl(this._dronesService);

  @override
  Future<DataState<List<DroneModel>>> getDrones() async {
    try {
      final httpResponse = await _dronesService.getDrones();

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
