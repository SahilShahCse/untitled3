import 'package:dio/dio.dart';

class Api {
  static final _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));

  static Future<Map<String, dynamic>> getMethod(String url) async {
    try {
      var res = await _dio.get(url);
      if (res.data is List) {
        var data = {'data': res.data};
        return data;
      }
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
