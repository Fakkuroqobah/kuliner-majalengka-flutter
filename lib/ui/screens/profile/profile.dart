import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../core/controllers/user/user_controller.dart';
import '../../../core/models/detail_model.dart';
import '../../../core/configs/api.dart';
import '../../constants/style.dart';

class Profile extends StatelessWidget {
  final UserController _userController = UserController();

  Profile() {
    _userController.details();
  }

  @override
  Widget build(BuildContext context) {
    final futureProfile = _userController.detail;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.primary,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 240.0,
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)
                  ),
                ),
              ),

              Container(
                height: 120.0,
                decoration: BoxDecoration(
                  color: Style.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)
                  ),
                ),
              ),

              Observer(
                builder: (_) {
                  switch(futureProfile.status) {
                    case FutureStatus.pending:
                      return Column(
                        children: <Widget>[
                          SizedBox(height: 50.0),
                          Center(child: CircularProgressIndicator()),
                        ],
                      );
                      break;

                    case FutureStatus.rejected:
                      return Center(child: Text("Failed to load data"));
                      break;

                    case FutureStatus.fulfilled:
                      final DetailModel detailModel = futureProfile.result;

                      return Center(
                        child: Column(
                          children: <Widget>[
                            Text(detailModel.data.user.userName, style: TextStyle(
                              fontFamily: "MontserratAlternatesBold",
                              fontSize: 20.0,
                            )),

                            SizedBox(height: 8.0),
                            Text(detailModel.data.user.userEmail, style: TextStyle(
                              fontFamily: "MontserratAlternatesLight",
                            )),

                            SizedBox(height: 20.0),
                            CircleAvatar(backgroundImage: 
                              NetworkImage(
                                Api.userSource + detailModel.data.user.userImage,
                              ), 
                              radius: 50.0
                            ),

                            SizedBox(height: 18.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                buildStatus(2, "Suka"),
                                buildStatus(5, "Rating"),
                              ],
                            )
                          ],
                        ),
                      );
                      break;
                    
                    default:
                      return Container();
                      break;
                  }
                }
              ),
            ],
          ),

          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  onTap: () {},
                  title: Text("Bookmark"),
                  leading: Icon(EvaIcons.bookmarkOutline),
                  trailing: Icon(EvaIcons.arrowRightOutline),
                ),

                ListTile(
                  onTap: () => Navigator.pushNamed(context, "account"),
                  title: Text("Akun"),
                  leading: Icon(EvaIcons.personOutline),
                  trailing: Icon(EvaIcons.arrowRightOutline),
                ),

                ListTile(
                  onTap: () {},
                  title: Text("Pengaturan"),
                  leading: Icon(EvaIcons.settings2Outline),
                  trailing: Icon(EvaIcons.arrowRightOutline),
                ),

                ListTile(
                  onTap: () => _userController.logout(),
                  title: Text("Logout", style: TextStyle(color: Colors.red)),
                  leading: Icon(EvaIcons.logOutOutline, color: Colors.red),
                  trailing: Icon(EvaIcons.arrowRightOutline, color: Colors.red),
                ),
              ],
            ),
          )
        ],
      )
    );
  }

  Column buildStatus(int sum, String title) {
    return Column(
      children: <Widget>[
        Text(sum.toString(), style: TextStyle(
          fontFamily: "MontserratAlternatesMedium",
          fontSize: 20.0,
        )),

        SizedBox(height: 2.0),
        Text(title, style: TextStyle(
          fontFamily: "MontserratAlternatesLight",
        ))
      ],
    );
  }
}