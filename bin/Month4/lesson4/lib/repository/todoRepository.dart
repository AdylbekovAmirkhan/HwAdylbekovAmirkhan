import 'package:dio/dio.dart';
import 'package:lesson4/project/model.dart';

class TodoRepository {
  late final Dio _dio;

  TodoRepository() {
    _dio = Dio();
  }

  Future<Todo> getIt() async {
    final response = await _dio.get('https://dummyjson.com/todos/2');

    final dynamic json = response.data;
    final Todo model;

    model = Todo.fromJson(json);
    print(model);
    return model;
  }
}