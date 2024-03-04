import 'package:bloc_newsapp_complete/core/constants/constants.dart';
import 'package:bloc_newsapp_complete/features/dailynews/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-hidelines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
