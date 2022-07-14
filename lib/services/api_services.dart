import 'dart:convert';

import 'package:news/model/article_model.dart';
import 'package:http/http.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=aaa7f7a166e243d6993b9e81e724f714";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
