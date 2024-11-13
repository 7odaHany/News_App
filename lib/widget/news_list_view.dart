import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/widget/news_tile.dart';



class NewListViews extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewListViews({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articles.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: NewsTile(
                    articleModel: articles[index],
                  ),
                );
              },
            ),
          );
  }
}
