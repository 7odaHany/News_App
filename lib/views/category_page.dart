import 'package:flutter/material.dart';
import 'package:news_app/widget/news_list_view_builder.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category , style: const TextStyle(color: Colors.black , fontWeight : FontWeight.bold ), ),
      ),
      body : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
         slivers :[
            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
            NewsListBuilder(category: category,)
         ]
        ),
      ),
    );
  }
}