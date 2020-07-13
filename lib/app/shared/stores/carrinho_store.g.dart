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
  Computed<double> _$finalValueComputed;

  @override
  double get finalValue =>
      (_$finalValueComputed ??= Computed<double>(() => super.finalValue,
              name: '_CarrinhoStoreBase.finalValue'))
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

  final _$cartAtom = Atom(name: '_CarrinhoStoreBase.cart');

  @override
  ObservableList<CarrinhoHeroModel> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(ObservableList<CarrinhoHeroModel> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
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
  dynamic addInCart(CarrinhoHeroModel value) {
    final _$actionInfo = _$_CarrinhoStoreBaseActionController.startAction(
        name: '_CarrinhoStoreBase.addInCart');
    try {
      return super.addInCart(value);
    } finally {
      _$_CarrinhoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeFromCart(CarrinhoHeroModel value) {
    final _$actionInfo = _$_CarrinhoStoreBaseActionController.startAction(
        name: '_CarrinhoStoreBase.removeFromCart');
    try {
      return super.removeFromCart(value);
    } finally {
      _$_CarrinhoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
cart: ${cart},
loggedIn: ${loggedIn},
finalValue: ${finalValue}
    ''';
  }
}
