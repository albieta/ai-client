import 'package:ai_client/data/providers/network/api_endpoint.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'general_service.g.dart';


@RestApi(baseUrl:APIEndpoint.baseUrl)
abstract class GeneralService<T> {
  factory GeneralService(Dio dio, {String? baseUrl}) = _GeneralService<T>;
  
  @GET('')
  Future<HttpResponse<List<T>>> getItems(@Path('') String endpoint);
}
