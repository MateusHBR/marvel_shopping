import 'package:flutter/material.dart';

class UserLoggedOffComponent extends StatelessWidget {
  final Function function;

  const UserLoggedOffComponent({@required this.function});
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: Text(
                "?",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Bem-Vindo!'),
              FlatButton(
                padding: EdgeInsets.only(left: 5),
                onPressed: function,
                child: Text(
                  "Conecte-se Aqui!",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
