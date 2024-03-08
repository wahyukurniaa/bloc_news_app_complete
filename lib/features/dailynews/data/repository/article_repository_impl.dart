import 'dart:io';

import 'package:bloc_newsapp_complete/core/constants/constants.dart';
import 'package:bloc_newsapp_complete/core/resources/data_state.dart';
import 'package:bloc_newsapp_complete/features/dailynews/data/data_sources/remote/news_api_service.dart';
import 'package:bloc_newsapp_complete/features/dailynews/data/models/article.dart';
import 'package:bloc_newsapp_complete/features/dailynews/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newAPIkey,
        country: countryQuery,
        category: categoryQuery,
      );

      // Tampilkan respons API
      // debugPrint('HTTP Response: ${httpResponse.response}');
      debugPrint('Data from API: ${httpResponse.data}');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        // Jika kode respons OK, periksa isi data
        if (httpResponse.data != null) {
          // Data berhasil diterima
          debugPrint('data ditampilkan berhasil');
          return DataSuccess(httpResponse.data!);
        } else {
          // Data kosong atau null
          return DataFailed(DioException(
            error: 'Data is empty or null',
            response: Response(requestOptions: RequestOptions(path: '')),
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ));
        }
      } else {
        // Kode respons tidak OK
        return DataFailed(DioException(
          error: 'HTTP Error: ${httpResponse.response.statusMessage}',
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      // Tangani kesalahan jaringan atau kesalahan lainnya
      return DataFailed(e);
    }
  }
}
