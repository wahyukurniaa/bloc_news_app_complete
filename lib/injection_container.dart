import 'package:bloc_newsapp_complete/features/dailynews/data/data_sources/remote/news_api_service.dart';
import 'package:bloc_newsapp_complete/features/dailynews/data/repository/article_repository_impl.dart';
import 'package:bloc_newsapp_complete/features/dailynews/domain/repository/article_repository.dart';
import 'package:bloc_newsapp_complete/features/dailynews/domain/usecases/get_article.dart';
import 'package:bloc_newsapp_complete/features/dailynews/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();

Future<void> initializeDepedencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());
  //Depedencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  //Bloc
  sl.registerSingleton<RemoteArticleBloc>(RemoteArticleBloc(sl()));
}
