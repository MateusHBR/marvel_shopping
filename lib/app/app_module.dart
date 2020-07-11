import 'package:dio/dio.dart';
import 'package:marvel_store/app/shared/util/base_url.dart';
import 'package:marvel_store/app/shared/repositories/marvel_repository.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marvel_store/app/app_widget.dart';
import 'package:marvel_store/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_WITH_KEY))),
        Bind((i) => MarvelRepository(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
