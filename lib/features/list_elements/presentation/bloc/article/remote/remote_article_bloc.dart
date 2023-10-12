import 'package:ai_client/core/resources/data_state.dart';
import 'package:ai_client/features/list_elements/domain/usecases/get_article.dart';
import 'package:ai_client/features/list_elements/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:ai_client/features/list_elements/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArtriclesBloc extends Bloc<RemoteArticlesEvent,RemoteArticleState>{

  final GetArticleUseCase _getArticleUseCase;
  RemoteArtriclesBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()){
    on <GetArticles> (onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticlesDone(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      emit(
        RemoteArticlesError(dataState.error!)
      );
    }
  }
}