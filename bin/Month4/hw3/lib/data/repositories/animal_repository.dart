import 'package:dio/dio.dart';
import '../models/cat_model.dart';

class AnimalRepository {
  late final Dio _dio;

  AnimalRepository() {
    _dio = Dio();
  }

  Future<List<CatModel>> getCats() async {
    final response = await _dio.get(
      'https://api.thecatapi.com/v1/images/search',
    );

    final List<dynamic> jsonList = response.data;
    final List<CatModel> catList = [];

    for (var json in jsonList) {
      catList.add(CatModel.fromJson(json));
    }

    return catList;
  }
}
