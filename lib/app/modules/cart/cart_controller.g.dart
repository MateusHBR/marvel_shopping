// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  Computed<ObservableList<CarrinhoHeroModel>> _$comprasComputed;

  @override
  ObservableList<CarrinhoHeroModel> get compras => (_$comprasComputed ??=
          Computed<ObservableList<CarrinhoHeroModel>>(() => super.compras,
              name: '_CartControllerBase.compras'))
      .value;
  Computed<double> _$finalValueComputed;

  @override
  double get finalValue =>
      (_$finalValueComputed ??= Computed<double>(() => super.finalValue,
              name: '_CartControllerBase.finalValue'))
          .value;
  Computed<int> _$allCharactersQuantityComputed;

  @override
  int get allCharactersQuantity => (_$allCharactersQuantityComputed ??=
          Computed<int>(() => super.allCharactersQuantity,
              name: '_CartControllerBase.allCharactersQuantity'))
      .value;

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  void addInCart(HeroModel hero) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.addInCart');
    try {
      return super.addInCart(hero);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart(HeroModel hero) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeFromCart');
    try {
      return super.removeFromCart(hero);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
compras: ${compras},
finalValue: ${finalValue},
allCharactersQuantity: ${allCharactersQuantity}
    ''';
  }
}
