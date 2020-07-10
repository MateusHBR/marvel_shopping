import 'package:marvel_store/app/shared/models/hero_model.dart';
import 'package:marvel_store/app/shared/repositories/marvel_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final MarvelRepository _repository;

  _HomeControllerBase(this._repository) {
    loadRepositoryData();
  }

  static ObservableFuture<List<HeroModel>> emptyFuture =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<HeroModel>> heroFuture = emptyFuture;

  ObservableList<HeroModel> heroList = <HeroModel>[].asObservable();

  @observable
  int offset = 0;

  final int limit = 20;

  loadRepositoryData() {
    heroFuture = _repository.getHeroes(offset: offset).asObservable();

    heroFuture.whenComplete(() => heroList.addAll(heroFuture.value));
  }
}
