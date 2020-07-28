import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/controllers/category/category_controller.dart';
import '../../../core/controllers/menu/menu_controller.dart';
import '../../../core/controllers/restaurant/restaurant_controller.dart';
import '../../../core/models/menu_model.dart';
import '../../../core/models/restaurant_model.dart';
import '../../../core/models/category_model.dart';
import '../../../core/utils/navigation.dart';
import '../../../core/utils/injector.dart';
import '../../../core/utils/rupiah.dart';
import '../../../core/configs/api.dart';
import '../../constants/style.dart';
import '../widget/shimmer/shimmerRestaurant.dart';
import '../widget/shimmer/shimmerCategory.dart';
import '../widget/shimmer/shimmerMenu.dart';
import '../widget/checkConnection.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SharedPreferences _preferences = locator<SharedPreferences>();
  final CategoryController _categoryController = CategoryController();
  final RestaurantController _restaurantController = RestaurantController();
  final MenuController _menuController = MenuController();

  Future<Null> _refreshContent() async {
    await _categoryController.random();
    await _restaurantController.random();
    await _menuController.random();
    setState(() {});
    return null;
  }

  String getTime() {
    int h = DateTime.now().hour;
    
    if(h >= 4 && h < 10) {
      return "Pagi";
    }else if(h >= 10 && h < 14) {
      return "Siang";
    }else if(h >= 14 && h <= 18) {
      return "Sore";
    }else {
      return "Malam";
    }
  }

  @override
  void initState() {
    _categoryController.random();
    _restaurantController.random();
    _menuController.random();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final futureCategory = _categoryController.categoriesRandom;
    final futureRestaurant = _restaurantController.restaurantsRandom;
    final futureMenu = _menuController.menusRandom;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Kuliner Majalengka", style: Style.textAppBar),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => locator<Navigation>().navigateTo("profile"),
          child: Icon(EvaIcons.personOutline),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 14.0, top: 16.0),
            child: GestureDetector(
              onTap: () => locator<Navigation>().navigateTo('notif'),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Icon(EvaIcons.bellOutline),
                  Positioned(
                    right: -3,
                    top: -5,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("6", textAlign: TextAlign.center, style: TextStyle(
                        color: Colors.white
                      )),
                      width: 18.0,
                      height: 18.0,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadiusDirectional.circular(50.0)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: OfflineBuilder(
        connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;

          return CheckConnection(connected, child);
        },
        child: RefreshIndicator(
          onRefresh: _refreshContent,
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Selamat ${getTime()} ${_preferences.getString("userName")}", style: Style.thick)
                        ?? Text("Selamat ${getTime()}", style: Style.thick)
                      ],
                    ),

                    SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        Text("Yuk Makan!", style: Style.heading)
                      ],
                    ),

                    SizedBox(height: 14.0),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Style.secondary,
                        hintText: "Mau cari apa?",
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.secondary
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6.0))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Style.primary
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 22.0),
                    Observer(
                      builder: (_) {
                        switch(futureCategory.status) {
                          case FutureStatus.pending:
                            return Container(height:40.0,child: ShimmerCategory());
                            break;

                          case FutureStatus.rejected:
                            return Center(child: Text("Failed to load data"));
                            break;

                          case FutureStatus.fulfilled:
                            final List<CategoryModel> category = futureCategory.result;
                            return Container(
                              height: 40.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: category.length,
                                itemBuilder: (context, index) {
                                  CategoryModel data = category[index];
                                  return buildCategory(title: data.categoryName);
                                },
                              ),
                            );
                            break;

                          default:
                            return Container();
                            break;
                        }
                      }
                    ),

                    SizedBox(height: 22.0),
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: "Restaurant terdekat ", style: Style.bold),
                              TextSpan(text: "(Lihat lainnya)", style: Style.thick),
                            ]
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 14.0),
                    Observer(
                      builder: (_)  {
                        switch(futureRestaurant.status) {
                          case FutureStatus.pending:
                            return Container(height: 155.0, child: ShimmerRestaurant());
                            break;

                          case FutureStatus.rejected:
                            return Center(child: Text("Failed to load data"));
                            break;

                          case FutureStatus.fulfilled:
                            final List<RestaurantModel> restaurant = futureRestaurant.result;
                            return Container(
                              height: 155.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: restaurant.length,
                                itemBuilder: (context, index) {
                                  RestaurantModel data = restaurant[index];
                                  return buildResto(data: data);
                                },
                              ),
                            );
                            break;

                          default:
                            return Container();
                            break;
                        }
                      }
                    ),

                    SizedBox(height: 22.0),
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: "Menu populer ", style: Style.bold),
                              TextSpan(text: "(Lihat lainnya)", style: Style.thick,
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  locator<Navigation>().navigateTo("menu");
                                }
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.0),
                    Observer(
                      builder: (_) {
                        switch(futureMenu.status) {
                          case FutureStatus.pending:
                            return ShimmerMenu();
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

                    SizedBox(height: 10.0)
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  Row buildNavigationText(String title, IconData icon) {
    return Row(
      children: <Widget>[
        Icon(icon, size: 20.0),
        SizedBox(width: 6.0),
        Text(title, style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            fontFamily: "MontserratAlternatesBold",
          ),
        ),
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
      margin: EdgeInsets.only(bottom: 15.0),
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

  Container buildResto({dynamic data}) {
    return Container(
      width: 200.0,
      margin: EdgeInsets.only(right: 14.0),
      child: InkWell(
        onTap: () => locator<Navigation>().navigateTo('home'),
        child: Column(
          children: <Widget>[
            Column(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                child: Image.network(
                  Api.restoSource + data.restaurantImage, 
                  height: 100.0, 
                  width: double.infinity, 
                  fit: BoxFit.fitWidth
                )
              ),
            ]),

            Column(children: <Widget>[
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Text(data.restaurantName, style: Style.bold),
                ],
              ),

              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Text(data.restaurantAddress, style: Style.thick),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }

  Row buildCategory({String title}) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
          child: Ink(
            height: 40.0,
            decoration: BoxDecoration(
              color: Style.primary,
              borderRadius: BorderRadius.all(Radius.circular(80.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                ],
              ),
            )
          ),
        ),
        SizedBox(width: 8.0)
      ],
    );
  }
}