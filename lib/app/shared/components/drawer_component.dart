import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_store/app/shared/stores/carrinho_store.dart';
import './user_logged_off_component.dart';

class DrawerComponent extends StatelessWidget {
  final CarrinhoStore carrinhoStore = Modular.get<CarrinhoStore>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Drawer(
      child: Observer(
        builder: (_) {
          if (!carrinhoStore.loggedIn) {
            return Column(
              children: <Widget>[
                UserLoggedOffComponent(
                  function: () {
                    Modular.to.pushNamed('/login');
                  },
                  // function: carrinhoStore.logIn,
                ),
                Container(),
              ],
            );
          } else {
            return Column(
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 70,
                        width: 70,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          child: Icon(
                            Icons.person_outline,
                            size: 40,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Bem-Vindo ${carrinhoStore.user.name}!'),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Carrinho'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Divider(),
                ListTile(
                  onTap: carrinhoStore.logOut,
                  leading: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Sair',
                    style: TextStyle(color: Colors.red),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red,
                  ),
                ),
                Divider(),
              ],
            );
          }
        },
      ),
    );
  }
}
