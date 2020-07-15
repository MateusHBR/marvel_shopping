import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:marvel_store/app/shared/models/hero_model.dart';
import 'cart_controller.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key key, this.title = "Cart"}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ModularState<CartPage, CartController> {
  //use 'controller' variable to access controller
  final oCcy =
      new NumberFormat.simpleCurrency(locale: 'pt_Br', decimalDigits: 2);

  void showGlobalDialog(BuildContext context, HeroModel hero) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text('Remover'),
          content: Text('Deseja realmente remover esse item do carrinho?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                controller.removeFromCart(hero);
                Navigator.of(context).pop();
              },
              child: Text('Sim'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Não'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),
        height: size.height,
        width: size.width,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: <Widget>[
                Container(
                  height: constraints.maxHeight * 0.8,
                  child: Observer(
                    builder: (_) {
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        itemCount: controller.compras.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                        itemBuilder: (context, index) {
                          var hero = controller.compras[index].hero;
                          return Card(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                Modular.to.pushNamed('/home/item',
                                    arguments: controller.compras[index].hero);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: size.height * 0.1,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: hero.url,
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Center(
                                            child: Icon(
                                              Icons.error,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.4,
                                          child: Text(
                                            hero.name,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.4,
                                          child: Text(
                                            '${oCcy.format(hero.id)}',
                                            style:
                                                TextStyle(color: Colors.grey),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            controller.addInCart(hero);
                                          },
                                        ),
                                        Observer(
                                          builder: (_) {
                                            return Text(
                                              controller.compras[index].quantity
                                                  .toString(),
                                            );
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.remove_circle,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            if (controller
                                                    .compras[index].quantity <=
                                                1) {
                                              showGlobalDialog(context, hero);
                                            } else {
                                              controller.removeFromCart(hero);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: constraints.maxHeight * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Observer(
                            builder: (_) {
                              return Visibility(
                                visible: controller.allCharactersQuantity > 0,
                                child: Text(
                                  '${controller.allCharactersQuantity} Personagens no Carrinho',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                          Observer(
                            builder: (_) {
                              return controller.allCharactersQuantity > 0
                                  ? Text(
                                      'Valor total a pagar: ${oCcy.format(controller.finalValue)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Text(
                                      'Adicione personagens ao carrinho para realizar uma compra!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        height: size.height * 0.06,
                        width: double.infinity,
                        child: Observer(
                          builder: (_) {
                            return RaisedButton(
                              color: Colors.red,
                              disabledColor: Colors.red.withAlpha(80),
                              child: Text(
                                'Finalizar pagamento',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: controller.allCharactersQuantity > 0
                                  ? () {}
                                  : null,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
