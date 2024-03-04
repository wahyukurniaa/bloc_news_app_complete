import 'package:bloc_newsapp_complete/core/resources/data_state.dart';
import 'package:bloc_newsapp_complete/features/dailynews/data/models/article.dart';
import 'package:bloc_newsapp_complete/features/dailynews/domain/repository/article_repository.dart';

class ArticleRepositoryIpl extends ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
}
