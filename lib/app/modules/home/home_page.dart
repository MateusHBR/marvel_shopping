import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:marvel_store/app/shared/components/drawer_component.dart';

import './home_controller.dart';
import './components/item_image_component.dart';
import './components/hero_item_name_component.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Marvel Store"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  ScrollController _scrollController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      controller.offset += controller.limit;
      controller.loadRepositoryData();
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color backgroundColor = Theme.of(context).backgroundColor;

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerComponent(),
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                if (_scaffoldKey.currentState.isDrawerOpen) {
                  _scaffoldKey.currentState.openEndDrawer();
                } else {
                  _scaffoldKey.currentState.openDrawer();
                }
              },
            ),
            floating: true,
            title: Text(
              widget.title,
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: backgroundColor,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Observer(
            builder: (_) {
              if (controller.heroFuture.error != null) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text('ERRO'),
                  ),
                );
              }
              if (controller.heroList.length == 0) {
                return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return SliverPadding(
                padding: EdgeInsets.all(8),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, index) {
                      if (index == controller.heroList.length) {
                        return Center(
                          child: Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        var hero = controller.heroList[index];

                        return Center(
                          child: Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: Colors.grey[300], width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            elevation: 10,
                            child: Hero(
                              tag: hero.id,
                              child: GestureDetector(
                                onTap: () {
                                  Modular.link
                                      .pushNamed('/item', arguments: hero);
                                },
                                child: Container(
                                  width: size.width,
                                  height: size.height * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Stack(
                                        children: <Widget>[
                                          ItemImageComponent(
                                            constraints: constraints,
                                            hero: hero,
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                Modular.link.pushNamed('/item',
                                                    arguments: hero);
                                              },
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(50),
                                                  bottomLeft:
                                                      Radius.circular(50),
                                                ),
                                                child: HeroItemNameComponent(
                                                  constraints: constraints,
                                                  hero: hero,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 2,
                                            top: 2.5,
                                            child: Container(
                                              height: size.height * 0.06,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(50),
                                                ),
                                                child: Material(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        'R\$ ${hero.id.toStringAsFixed(2).replaceAll('.', ',')}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    childCount: controller.heroList.length + 1,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
