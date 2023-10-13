import 'dart:io';
import 'package:ai_client/app/util/data_state.dart';
import 'package:ai_client/data/models/user_model.dart';
import 'package:ai_client/domain/repositories/user_repository.dart';
import 'package:ai_client/data/services/user_service.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final UsersService _usersService;

  UserRepositoryImpl(this._usersService);

  @override
  Future<DataState<List<UserModel>>> getUsers() async {
    try {
      final httpResponse = await _usersService.getUsers();

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
