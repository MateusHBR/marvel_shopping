import 'package:flutter/material.dart';
import 'package:marvel_store/app/shared/animations/fade_animation.dart';
import 'package:marvel_store/app/shared/models/hero_model.dart';

class HeroItemNameComponent extends StatelessWidget {
  final BoxConstraints constraints;
  final HeroModel hero;

  const HeroItemNameComponent({
    Key key,
    @required this.constraints,
    @required this.hero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      width: constraints.maxWidth,
      color: Colors.black.withOpacity(0.5),
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Text(
          hero.name.isNotEmpty ? hero.name : "Nome não disponível",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
