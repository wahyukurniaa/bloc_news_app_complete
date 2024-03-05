part of 'remote_article_bloc.dart';

sealed class RemoteArticleEvent {
  const RemoteArticleEvent();
}

class GetArticle extends RemoteArticleEvent {
  const GetArticle();
}
