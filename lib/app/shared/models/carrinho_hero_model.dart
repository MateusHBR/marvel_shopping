import 'package:marvel_store/app/shared/models/hero_model.dart';

class CarrinhoHeroModel {
  HeroModel hero;
  int quantity;

  CarrinhoHeroModel({this.hero, this.quantity = 1});

  copyWith({HeroModel hero, int quantity}) {
    return CarrinhoHeroModel(
      hero: hero ?? this.hero,
      quantity: quantity ?? this.quantity,
    );
  }
}
