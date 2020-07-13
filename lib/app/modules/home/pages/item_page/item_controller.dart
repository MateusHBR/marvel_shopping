import 'package:marvel_store/app/shared/models/carrinho_hero_model.dart';
import 'package:marvel_store/app/shared/models/hero_model.dart';
import 'package:mobx/mobx.dart';
import 'package:marvel_store/app/shared/stores/carrinho_store.dart';
part 'item_controller.g.dart';

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  final CarrinhoStore _carrinhoStore;

  _ItemControllerBase(this._carrinhoStore);

  @computed
  bool get userLogged => _carrinhoStore.user.isLoggedIn;

  @action
  addInCart(HeroModel hero) {
    _carrinhoStore.addInCart(
      CarrinhoHeroModel(
        hero: hero,
        quantity: 1,
      ),
    );
  }
}
