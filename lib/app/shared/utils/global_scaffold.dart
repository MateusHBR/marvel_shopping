import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();

  final scaffKey = GlobalKey<ScaffoldState>();

  void showSnackBar(SnackBar snackBar) {
    scaffKey.currentState.showSnackBar(snackBar);
  }
}
