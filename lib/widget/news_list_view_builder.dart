// ignore_for_file: use_key_in_widget_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widget/news_list_view.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(category: widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewListViews(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text('Error Occured'),
            ),
          );
        } else {
          return const Loading();
        }
      },
    );
    // return _loading
    //     ? const SliverFillRemaining(
    //         hasScrollBody: false,
    //         child: Center(child: CircularProgressIndicator()))
    //     :articles.isNotEmpty ? NewListViews(
    //         articles: articles,
    //       ): const SliverFillRemaining(
    //         hasScrollBody: false,
    //         child: Center(
    //           child: Text('No Data Found'),
    //         ),
    //       );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
