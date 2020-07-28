import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../constants/style.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun", style: Style.textAppBar),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          Center(
            child: CircleAvatar(backgroundImage: AssetImage('assets/images/aja.jpg'), radius: 50.0)
          ),

          SizedBox(height: 10.0),
          ListTile(
            onTap: () {},
            title: Text("Agung Maulana"),
            leading: Icon(EvaIcons.personOutline),
            trailing: Icon(EvaIcons.arrowRightOutline),
          ),

          ListTile(
            onTap: () {},
            title: Text("maulanaagung169@gmail.com"),
            leading: Icon(EvaIcons.emailOutline),
            trailing: Icon(EvaIcons.arrowRightOutline),
          ),

          ListTile(
            onTap: () {},
            title: Text("Ubah Password"),
            leading: Icon(EvaIcons.lockOutline),
            trailing: Icon(EvaIcons.arrowRightOutline),
          ),

          SizedBox(height: 10.0),
          Center(
            child: MaterialButton(
              onPressed: () {},
              minWidth: 150.0,
              height: 40.0,
              elevation: 0.0,
              color: Style.primary,
              child: Text("SIMPAN", style: TextStyle(color: Colors.white)),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(
                  color: Style.primary
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}