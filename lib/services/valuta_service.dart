import 'package:dio/dio.dart';
import 'package:newsapp/models/valuta_model.dart';

class ValutaService {
  static Future<List<ValutaModel>> getData() async {
    Response res = await Dio().get('https://nbu.uz/uz/exchange-rates/json/');
    return (res as List).map((e) => ValutaModel.fromJson(e)).toList();
  }
}
