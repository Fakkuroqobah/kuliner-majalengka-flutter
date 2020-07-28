import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../core/controllers/loading/loading_scroll/loading_scroll_controller.dart';
import '../../../core/controllers/menu/menu_controller.dart';
import '../../../core/models/menu_model.dart';
import '../../../core/utils/rupiah.dart';
import '../../../core/configs/api.dart';
import '../../constants/style.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final MenuController _menuController = MenuController();
  final LoadingScrollController _loadingScrollController = LoadingScrollController();
  final ScrollController _scrollController = new ScrollController();
  int index = 1;

  bool onNotification(ScrollNotification notif) {
    if(notif is ScrollUpdateNotification) {
      if(_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        _loadingScrollController.isLoading(true);
        if(index < _menuController.lastPage) {
          _menuController.all(page: index.toString()).then((_) {
            setState(() {});
          });
          index++;
        }else{
          _loadingScrollController.isLoading(false);
        }
      }
    }
    
    return true;
  }

  @override
  void initState() {
    _menuController.all();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final futureMenu = _menuController.menus;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Menu", style: Style.textAppBar),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: NotificationListener(
          onNotification: onNotification,
          child: ListView(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Observer(
                  builder: (_) {
                    switch(futureMenu.status) {
                      case FutureStatus.pending:
                        return Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        );
                        break;

                      case FutureStatus.rejected:
                        return Center(child: Text("Failed to load data"));
                        break;

                      case FutureStatus.fulfilled:
                        final List<MenuModel> menu = futureMenu.result;
                        return Column(
                          children: List.generate(menu.length, (index) {
                            MenuModel data = menu[index];
                            return buildMenu(data: data);
                          }),
                        );
                        break;

                      default:
                        return Container();
                        break;
                    }
                  },
                ),
              ),

              Observer(
                builder: (_) {
                  if(_loadingScrollController.loading) {
                    return buildLoading();
                  }else{
                    return Container();
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildLoading() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),

        SizedBox(height: 20.0)
      ],
    );
  }

  Container buildMenu({dynamic data}) {
    String menuInfo = "";

    if(data.menuInfo.length > 40) {
      menuInfo = data.menuInfo.substring(0, 40);
    }else{
      menuInfo = data.menuInfo;
    }

    return Container(
      height: 80.0,
      margin: EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: (){},
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.network(
                Api.menuSource + data.menuImage, 
                height: 100.0, 
                width: double.infinity, 
                fit: BoxFit.fitWidth
              )
            ),

            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(data.menuName, style: Style.bold),

                  SizedBox(height: 5.0),
                  Text(menuInfo + "...", style: Style.thick),

                  SizedBox(height: 10.0),
                  Text(rupiah(data.menuPrice.toString()), style: TextStyle(
                    color: Style.primary,
                    fontWeight: FontWeight.bold
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}