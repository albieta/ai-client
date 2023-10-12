import 'package:ai_client/core/resources/data_state.dart';
import 'package:ai_client/features/list_elements/domain/entities/article.dart';

abstract class ArticleRepository {
    Future<DataState<List<ArticleEntity>>> getNewsArticles();
}