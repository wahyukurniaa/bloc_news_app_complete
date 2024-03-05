import 'package:bloc_newsapp_complete/core/resources/data_state.dart';
import 'package:bloc_newsapp_complete/features/dailynews/domain/usecases/get_article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_newsapp_complete/features/dailynews/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticle>(onGetArticles);
    // on<>();
    // on<>();
  }
  void onGetArticles(GetArticle event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
