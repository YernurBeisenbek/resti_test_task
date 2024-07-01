import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:resti_test_task/data/models/post_model.dart';

class NewsApiService {
  static const String apiKey = '4f0c3cadd74a4067a40565c7f3b484a9';
  final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> articles = jsonResponse['articles'];
      return articles.map((article) => PostModel.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
