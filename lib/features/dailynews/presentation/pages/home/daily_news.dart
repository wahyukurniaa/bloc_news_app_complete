import 'package:bloc_newsapp_complete/features/dailynews/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:bloc_newsapp_complete/features/dailynews/presentation/widgets/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final bloc = BlocProvider.of<RemoteArticleBloc>(context);
    return Scaffold(
      appBar: _buildAppBar(context, bloc),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context, RemoteArticleBloc bloc) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            // Dispatch event to trigger refresh
            bloc.add(FetchRemoteArticles());
          },
        ),
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticleError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final article = state.article![index];

              return ArticleWidget(article: article);
            },
            itemCount: state.article!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
