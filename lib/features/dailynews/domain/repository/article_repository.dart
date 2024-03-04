import 'package:bloc_newsapp_complete/core/resources/data_state.dart';
import 'package:bloc_newsapp_complete/features/dailynews/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
