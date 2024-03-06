import 'package:bloc_newsapp_complete/config/theme/app_theme.dart';
import 'package:bloc_newsapp_complete/features/dailynews/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:bloc_newsapp_complete/features/dailynews/presentation/pages/home/daily_news.dart';
import 'package:bloc_newsapp_complete/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDepedencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticle()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
