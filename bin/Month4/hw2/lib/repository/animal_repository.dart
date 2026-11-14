import 'package:dio/dio.dart';

class AnimalRepository {
  final Dio _dio = Dio();

  Future<String> getDogImage() async {
    final Response response = 
    await _dio.get('https://api.thecatapi.com/v1/images/search');
    return response.data.first['url'];
  }
}