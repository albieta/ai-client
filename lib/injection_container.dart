import 'package:ai_client/features/list_elements/data/data_sources/remote/news_api_service.dart';
import 'package:ai_client/features/list_elements/data/repository/article_repository_impl.dart';
import 'package:ai_client/features/list_elements/domain/repository/article_repository.dart';
import 'package:ai_client/features/list_elements/domain/usecases/get_article.dart';
import 'package:ai_client/features/list_elements/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl())
  );

  // UseCases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl())
  );

  //Blocs
  sl.registerFactory<RemoteArtriclesBloc>(
    () => RemoteArtriclesBloc(sl())
  );
}