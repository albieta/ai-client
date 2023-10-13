import 'package:ai_client/data/models/user_model.dart';
import 'package:ai_client/data/providers/network/api_endpoint.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'user_service.g.dart';


@RestApi(baseUrl:APIEndpoint.baseUrl)
abstract class UsersService {
  factory UsersService(Dio dio) = _UsersService;
  
  @GET(Apis.users)
  Future<HttpResponse<List<UserModel>>> getUsers({
    @Query("id") String ? id,
    @Query("name") String ? name,
    @Query("surname") String ? surname,
    @Query("email") String ? email,
  });
}