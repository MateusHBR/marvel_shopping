// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoStore on _CarrinhoStoreBase, Store {
  Computed<bool> _$loggedInComputed;

  @override
  bool get loggedIn =>
      (_$loggedInComputed ??= Computed<bool>(() => super.loggedIn,
              name: '_CarrinhoStoreBase.loggedIn'))
          .value;

  final _$userAtom = Atom(name: '_CarrinhoStoreBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$carrinhoAtom = Atom(name: '_CarrinhoStoreBase.carrinho');

  @override
  ObservableList<CarrinhoHeroModel> get carrinho {
    _$carrinhoAtom.reportRead();
    return super.carrinho;
  }

  @override
  set carrinho(ObservableList<CarrinhoHeroModel> value) {
    _$carrinhoAtom.reportWrite(value, super.carrinho, () {
      super.carrinho = value;
    });
  }

  final _$_CarrinhoStoreBaseActionController =
      ActionController(name: '_CarrinhoStoreBase');

  @override
  dynamic logIn() {
    final _$actionInfo = _$_CarrinhoStoreBaseActionController.startAction(
        name: '_CarrinhoStoreBase.logIn');
    try {
      return super.logIn();
    } finally {
      _$_CarrinhoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic logOut() {
    final _$actionInfo = _$_CarrinhoStoreBaseActionController.startAction(
        name: '_CarrinhoStoreBase.logOut');
    try {
      return super.logOut();
    } finally {
      _$_CarrinhoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool itemInCart(HeroModel hero) {
    final _$actionInfo = _$_CarrinhoStoreBaseActionController.startAction(
        name: '_CarrinhoStoreBase.itemInCart');
    try {
      return super.itemInCart(hero);
    } finally {
      _$_CarrinhoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic add(CarrinhoHeroModel value) {
    final _$actionInfo = _$_CarrinhoStoreBaseActionController.startAction(
        name: '_CarrinhoStoreBase.add');
    try {
      return super.add(value);
    } finally {
      _$_CarrinhoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic subtract(CarrinhoHeroModel value) {
    final _$actionInfo = _$_CarrinhoStoreBaseActionController.startAction(
        name: '_CarrinhoStoreBase.subtract');
    try {
      return super.subtract(value);
    } finally {
      _$_CarrinhoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
carrinho: ${carrinho},
loggedIn: ${loggedIn}
    ''';
  }
}
