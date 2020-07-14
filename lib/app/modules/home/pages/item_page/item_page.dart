import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_store/app/shared/animations/fade_animation.dart';
import 'package:marvel_store/app/shared/models/hero_model.dart';
import 'package:marvel_store/app/shared/utils/global_scaffold.dart';
import 'item_controller.dart';

class ItemPage extends StatefulWidget {
  final HeroModel hero;
  final String title;
  const ItemPage({Key key, this.title = "ItemPage", @required this.hero})
      : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends ModularState<ItemPage, ItemController> {
  //use 'controller' variable to access controller

  // final snackbar = ;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            leading: InkWell(
              onTap: () {
                Modular.to.pop();
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            expandedHeight: size.height * 0.35,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.hero.id,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.hero.url,
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
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                    delay: 0.8,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        widget.hero.name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    delay: 1.0,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'R\$ ${widget.hero.id.toStringAsFixed(2).replaceAll('.', ',')}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    delay: 1.2,
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.4,
                      child: Text(
                        loremIpsum,
                        textAlign: TextAlign.justify,
                        maxLines: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: Container(
                      width: double.infinity,
                      child: Observer(
                        builder: (_) {
                          return RaisedButton(
                            color: Colors.white,
                            child: controller.userLogged
                                ? Text(
                                    'Adicionar ao carrinho',
                                    style: TextStyle(),
                                  )
                                : Text(
                                    'Fazer login',
                                    style: TextStyle(),
                                  ),
                            onPressed: controller.userLogged
                                ? () {
                                    controller.addInCart(widget.hero);
                                    GlobalScaffold.instance.showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('Item adicionado ao carrinho'),
                                        duration: Duration(milliseconds: 1800),
                                        action: SnackBarAction(
                                          label: 'Desfazer',
                                          textColor: Colors.red,
                                          onPressed: () => controller
                                              .removeFromCart(widget.hero),
                                        ),
                                      ),
                                    );
                                  }
                                : () {
                                    Modular.to.pushNamed('/login');
                                  },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String loremIpsum =
      "What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's "
      "standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
      " It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s"
      " with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions "
      "of Lorem Ipsum.Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point"
      " of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',"
      " making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum'"
      " will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
      "Where does it come from?Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000"
      " years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, "
      "and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et "
      "Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem"
      " Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections "
      "1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H."
      " Rackham.Where can I get some?here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised"
      " words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text."
      " All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 "
      "Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from"
      " repetition, injected humour, or non-characteristic words etc.";
}
