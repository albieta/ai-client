import 'package:ai_client/data/models/drone_model.dart';
import 'package:ai_client/data/providers/network/api_endpoint.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'drone_service.g.dart';


@RestApi(baseUrl:APIEndpoint.baseUrl)
abstract class DronesService {
  factory DronesService(Dio dio) = _DronesService;
  
  @GET(Apis.drones)
  Future<HttpResponse<List<DroneModel>>> getDrones({
    @Query("id") String ? id,
    @Query("name") String ? name,
    @Query("model") String ? model,
  });
}