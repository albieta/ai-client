import 'package:ai_client/core/resources/data_state.dart';
import 'package:ai_client/core/usecase/usecase.dart';
import 'package:ai_client/features/list_elements/domain/entities/article.dart';
import 'package:ai_client/features/list_elements/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void>{

  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }

}
