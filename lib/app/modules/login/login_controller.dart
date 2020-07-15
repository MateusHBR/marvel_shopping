import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_store/app/shared/stores/carrinho_store.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final CarrinhoStore _carrinhoStore;

  _LoginControllerBase(this._carrinhoStore);

  @observable
  bool loading = false;

  @action
  Future<bool> login(String user, String password) async {
    loading = true;

    await Future.delayed(Duration(milliseconds: 1200));

    if (user == _carrinhoStore.user.login &&
        password == _carrinhoStore.user.password) {
      _carrinhoStore.logIn();
      Modular.to.pop();
      loading = false;
      return true;
    } else {
      loading = false;
      return false;
    }
  }
}
