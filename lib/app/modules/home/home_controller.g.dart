// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$userLoggedComputed;

  @override
  bool get userLogged =>
      (_$userLoggedComputed ??= Computed<bool>(() => super.userLogged,
              name: '_HomeControllerBase.userLogged'))
          .value;

  final _$heroFutureAtom = Atom(name: '_HomeControllerBase.heroFuture');

  @override
  ObservableFuture<List<HeroModel>> get heroFuture {
    _$heroFutureAtom.reportRead();
    return super.heroFuture;
  }

  @override
  set heroFuture(ObservableFuture<List<HeroModel>> value) {
    _$heroFutureAtom.reportWrite(value, super.heroFuture, () {
      super.heroFuture = value;
    });
  }

  final _$offsetAtom = Atom(name: '_HomeControllerBase.offset');

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  @override
  String toString() {
    return '''
heroFuture: ${heroFuture},
offset: ${offset},
userLogged: ${userLogged}
    ''';
  }
}
