import 'dart:convert';

import 'package:api_app/article_model.dart';
import 'package:http/http.dart';

// class API_MANAGER {
//   void getNews() async {
//     var client = http.Client();

//     var response = await client.get(
//       Uri.parse(
//           "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=110d227e30db4f62bb962db1e14486b2"),
//     );
//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//     }
//   }
// }

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint

  //NOTE: make sure to use your OWN apikey, you can make a free acount and
  // choose a developer option it's FREE
  final endPointUrl =
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=110d227e30db4f62bb962db1e14486b2";

  //Now let's create the http request function
  // but first let's import the http package

  Future<List<Article>> getArticle() async {
    Response res = await get(
      Uri.parse(endPointUrl),
    );

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
