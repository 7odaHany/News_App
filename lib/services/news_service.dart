import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
  Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=f3dfd8d1f30f4e2ea542b65ebc36fb7c&category=$category');
  
  Map<String, dynamic> jsonData = response.data;
  List<dynamic> articles = jsonData['articles'];
  // ignore: non_constant_identifier_names
  List<ArticleModel> ArticleList = [];
  
  for (var element in articles) {
    ArticleList.add(ArticleModel(
      url: element['url'],
      title: element['title'],
      image: element['urlToImage'],
      subTitle: element['description'],
    ));
  }
  return ArticleList;
}  catch (e) {
  return [];
}
  }
}
