import 'package:marvel_store/app/shared/models/carrinho_hero_model.dart';
import 'package:marvel_store/app/shared/models/hero_model.dart';
import 'package:marvel_store/app/shared/stores/carrinho_store.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final CarrinhoStore _carrinhoStore;

  _CartControllerBase(this._carrinhoStore);

  @computed
  ObservableList<CarrinhoHeroModel> get compras => _carrinhoStore.cart;

  @action
  void addInCart(HeroModel hero) {
    _carrinhoStore.addInCart(
      CarrinhoHeroModel(hero: hero),
    );
  }

  @action
  void removeFromCart(HeroModel hero) {
    _carrinhoStore.removeFromCart(CarrinhoHeroModel(hero: hero));
  }

  @computed
  double get finalValue => _carrinhoStore.finalValue;
}
