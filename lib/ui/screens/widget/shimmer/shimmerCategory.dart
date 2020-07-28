import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white60,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            buildLoad(),
            buildLoad(),
            buildLoad(),
          ],
        ),
      ),
    );
  }

  Container buildLoad() {
    return Container(
      width: 140.0,
      height: 40.0,
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(80.0))
      ),
    );
  }
}