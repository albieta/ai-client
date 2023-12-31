
import 'package:ai_client/data/providers/api_endpoint.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'models_service.g.dart';


@RestApi(baseUrl:APIEndpoint.baseUrl)
abstract class ModelsService {
  factory ModelsService(Dio dio) = _ModelsService;
  
  @GET(Apis.models)
  Future<HttpResponse<dynamic>> getModels();

  @GET('/{model}')
  Future<HttpResponse<dynamic>> getElements(
    @Path('model') String model
  );

  @POST('/{model}')
  Future<HttpResponse<dynamic>> createElement(
    @Path('model') String model,
    @Body() Map<String, dynamic> requestBody
  );
}