import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class BackGround extends StatelessWidget {
  Widget child;
  BackGround({this.child});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFFF2E84),
                    Color(0xFFFFA091)
                  ]
              )
          ),
        ),
        child,
      ],
    );
  }
}
