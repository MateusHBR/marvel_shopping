import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_store/app/shared/models/user_model.dart';
import 'package:marvel_store/app/shared/stores/carrinho_store.dart';
import 'login_controller.dart';
import 'package:marvel_store/app/shared/utils/global_scaffold.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  // final CarrinhoStore carrinhoStore = Modular.get<CarrinhoStore>();
  final UserModel user = UserModel();
  final _formKey = GlobalKey<FormState>();
  final snackbar = SnackBar(
    content: Text('Login ou Senha inválidos'),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.1,
                width: size.height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/marvel.png'),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.5,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          TextFormField(
                            validator: (email) {
                              if (email.isEmpty) {
                                return 'Campo inválido';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              user.login = newValue;
                            },
                            decoration: InputDecoration(
                              labelText: 'Usuário',
                              hintText: 'Informe seu usuário',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onSaved: (newValue) {
                              user.password = newValue;
                            },
                            validator: (password) {
                              if (password.isEmpty) {
                                return 'Campo inválido';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              hintText: 'Informe sua senha',
                            ),
                          ),
                          FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Text('Esqueceu sua senha?'),
                          ),
                        ],
                      ),
                      Container(
                        width: size.width,
                        child: RaisedButton(
                          color: Colors.red,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              if (!controller.login(
                                  user.login, user.password)) {
                                GlobalScaffold.instance.showSnackBar(snackbar);
                              }
                            }
                          },
                        ),
                      ),
                      Container(
                        width: size.width,
                        child: FlatButton(
                          child: Text(
                            'Não possui conta? Registre-se',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
