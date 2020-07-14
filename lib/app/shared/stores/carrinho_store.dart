import 'package:marvel_store/app/shared/models/hero_model.dart';
import 'package:mobx/mobx.dart';
import '../models/carrinho_hero_model.dart';
import '../models/user_model.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStoreBase with _$CarrinhoStore;

abstract class _CarrinhoStoreBase with Store {
  _CarrinhoStoreBase() {
    // print(user.isLoggedIn);
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
  ObservableList<CarrinhoHeroModel> cart = <CarrinhoHeroModel>[].asObservable();

  // @action
  // bool itemInCart(HeroModel hero) {
  //   int index = cart.indexWhere((element) => element.hero.id == hero.id);
  //   if (index >= 0) {
  //     return true;
  //   }
  //   return false;
  // }

  @action
  addInCart(CarrinhoHeroModel value) {
    int index = cart.indexWhere((element) => element.hero.id == value.hero.id);
    if (index < 0) {
      cart.add(value);
    } else {
      int quantity = cart[index].quantity + 1;
      cart[index] = value.copyWith(quantity: quantity);
    }
  }

  @action
  removeFromCart(CarrinhoHeroModel value) {
    int index = cart.indexWhere((element) => element.hero.id == value.hero.id);
    if (cart[index].quantity > 1) {
      int quantity = cart[index].quantity - 1;
      cart[index] = value.copyWith(quantity: quantity);
    } else {
      cart.removeAt(index);
    }
  }

  @computed
  double get finalValue {
    if (cart.length > 0) {
      return cart
          .map((item) => item.quantity * item.hero.id.roundToDouble())
          .reduce((value, item) => value + item);
    } else {
      return 0.0;
    }
  }
}
