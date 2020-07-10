import 'package:dio/dio.dart';
import 'package:marvel_store/app/shared/models/hero_model.dart';

class MarvelRepository {
  final Dio _dio;

  MarvelRepository(this._dio);

  Future<List<HeroModel>> getHeroes() async {
    var response = await _dio.get("");
    List<HeroModel> heroes = [];

    for (var json in (response.data["data"]["results"] as List)) {
      var hero = HeroModel.fromJson(json);
      print(hero.url);
      heroes.add(hero);
    }

    return heroes;
  }
}
