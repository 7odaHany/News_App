import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widget/category_cart.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
   final List<CategoryModel> categories = const [
    CategoryModel(
      category : 'sports',
      image: 'assets/4.jpeg',
      categoryName: 'Sports',
    ),
    CategoryModel(
      category: 'business',
      image: 'assets/7.jpeg',
      categoryName: 'Business',
    ),
    CategoryModel(
      category: 'entertainment',
      image: 'assets/2.jpeg',
      categoryName: 'Entertainment',
    ),
    CategoryModel(
      category: 'health',
      image: 'assets/5.jpeg',
      categoryName: 'Health',
    ),
    CategoryModel(
      category: 'science',
      image: 'assets/6.jpeg',
      categoryName: 'Science',
    ),
    CategoryModel(
      category: 'technology',
      image: 'assets/technology.jpeg',
      categoryName: 'Technology',
    ),
    CategoryModel(
      category: 'general',
      image: 'assets/7.jpeg',
      categoryName: 'General',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return  CategoryCart(
              categores: categories[index],
            );
          }),
    );
  }
}
