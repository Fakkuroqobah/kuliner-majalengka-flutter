import 'package:flutter/material.dart';

import '../../constants/style.dart';

class Notif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notification", style: Style.textAppBar),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
    );
  }
}