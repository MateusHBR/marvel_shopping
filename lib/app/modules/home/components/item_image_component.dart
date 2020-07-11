import 'package:cached_network_image/cached_network_image.dart';
import 'package:marvel_store/app/shared/models/hero_model.dart';

import 'package:flutter/material.dart';

class ItemImageComponent extends StatelessWidget {
  final BoxConstraints constraints;
  final HeroModel hero;

  const ItemImageComponent({
    Key key,
    @required this.constraints,
    @required this.hero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: hero.url,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
