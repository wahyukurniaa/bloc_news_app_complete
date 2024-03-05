import 'package:bloc_newsapp_complete/core/resources/data_state.dart';
import 'package:bloc_newsapp_complete/core/usecases/usecase.dart';
import 'package:bloc_newsapp_complete/features/dailynews/domain/entities/article.dart';
import 'package:bloc_newsapp_complete/features/dailynews/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
