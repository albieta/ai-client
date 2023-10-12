import 'dart:io';

import 'package:ai_client/core/constants/constants.dart';
import 'package:ai_client/core/resources/data_state.dart';
import 'package:ai_client/features/list_elements/data/data_sources/remote/news_api_service.dart';
import 'package:ai_client/features/list_elements/data/models/article.dart';
import 'package:ai_client/features/list_elements/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          )
        );
      }
    } on DioException catch(e) {
      return DataFailed(e);
    }
  }
}
