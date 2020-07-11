import 'package:mobx/mobx.dart';
import 'package:marvel_store/app/shared/stores/carrinho_store.dart';
part 'item_controller.g.dart';

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  final CarrinhoStore _carrinhoStore;

  _ItemControllerBase(this._carrinhoStore);
}
