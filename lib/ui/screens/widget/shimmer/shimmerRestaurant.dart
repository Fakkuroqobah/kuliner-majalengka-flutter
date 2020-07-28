import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRestaurant extends StatelessWidget {
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
          ],
        ),
      ),
    );
  }

  Container buildLoad() {
    return Container(
      width: 200.0,
      margin: EdgeInsets.only(right: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 200.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              color: Colors.grey,
            )
          ),

          SizedBox(height: 10.0),
          buildTextShimmer(100.0),

          SizedBox(height: 10.0),
          buildTextShimmer(140.0),
        ],
      ),
    );
  }

  Row buildTextShimmer(double width) {
    return Row(
      children: <Widget>[
        Container(color: Colors.grey, width: width, height: 10.0),
      ]
    );
  }
}