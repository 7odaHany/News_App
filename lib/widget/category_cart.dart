import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/views/category_page.dart';

class CategoryCart extends StatelessWidget {
  const CategoryCart({super.key, required this.categores});
  final CategoryModel categores;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  CategoryPage(category: categores.category ,),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: 90,
          width: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(categores.image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              categores.categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
