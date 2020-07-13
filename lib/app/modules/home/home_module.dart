import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:marvel_store/app/shared/repositories/marvel_repository.dart';
import 'package:marvel_store/app/shared/stores/carrinho_store.dart';

import './home_controller.dart';
import './pages/item_page/item_controller.dart';
import './pages/item_page/item_page.dart';
import './home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CarrinhoStore()),
        Bind((i) => ItemController(i.get<CarrinhoStore>())),
        Bind(
          (i) => HomeController(
            i.get<MarvelRepository>(),
            i.get<CarrinhoStore>(),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router(
          '/item',
          child: (_, args) => ItemPage(
            hero: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
