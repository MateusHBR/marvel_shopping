import 'package:marvel_store/app/shared/models/hero_model.dart';
import 'package:mobx/mobx.dart';
import '../models/carrinho_hero_model.dart';
import '../models/user_model.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStoreBase with _$CarrinhoStore;

abstract class _CarrinhoStoreBase with Store {
  _CarrinhoStoreBase() {
    print(user.isLoggedIn);
  }

  @observable
  UserModel user = UserModel(
    login: "admin",
    password: "123",
    name: "ADMIN",
    isLoggedIn: false,
  );

  @computed
  bool get loggedIn => user.isLoggedIn;

  @action
  logIn() {
    user = user.copyWith(isLoggedIn: true);
  }

  @action
  logOut() {
    user = user.copyWith(isLoggedIn: false);
  }

  @observable
  ObservableList<CarrinhoHeroModel> carrinho =
      <CarrinhoHeroModel>[].asObservable();

  @action
  bool itemInCart(HeroModel hero) {
    int index = carrinho.indexWhere((element) => element.hero.id == hero.id);
    if (index >= 0) {
      return true;
    }
    return false;
  }

  @action
  add(CarrinhoHeroModel value) {
    int index =
        carrinho.indexWhere((element) => element.hero.id == value.hero.id);
    carrinho[index] = value.copyWith(quantity: value.quantity + 1);
  }

  @action
  subtract(CarrinhoHeroModel value) {
    int index =
        carrinho.indexWhere((element) => element.hero.id == value.hero.id);
    carrinho[index] = value.copyWith(quantity: value.quantity - 1);
  }
}
