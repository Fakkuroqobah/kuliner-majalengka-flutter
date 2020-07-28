import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white60,
        child: Column(
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
      height: 80.0,
      margin: EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(color: Colors.grey)
          ),

          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildTextShimmer(70.0),

                SizedBox(height: 10.0),
                buildTextShimmer(100.0),

                SizedBox(height: 20.0),
                buildTextShimmer(50.0),
              ],
            ),
          )
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