import 'package:dio/dio.dart';
import 'package:newsapp/models/news_model.dart';

class NewsService {
 static Future<NewsModel> getData() async {
    Response res = await Dio().get('https://newsapi.org/v2/everything?q=tesla&from=2022-02-01&sortBy=publishedAt&apiKey=c8191fd807b74a079e872b88bb3e7b0b');
    // print(res.data);
    return NewsModel.fromJson(res.data);
  }
}
