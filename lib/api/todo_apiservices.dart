import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:todoapi/models/todo_apimodel.dart';

class Apiservice {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  Future<List<Welcome>?> getpost() async {
    try {
      Response response = await dio.get('todos');
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> data = response.data;
        return data.map((item) => Welcome.fromJson(item)).toList();
      }
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }
}
