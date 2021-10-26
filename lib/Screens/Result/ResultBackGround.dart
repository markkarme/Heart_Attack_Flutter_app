import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BackGroundResult extends StatelessWidget {
  Widget child;
  BackGroundResult({this.child});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height,
          child: Image.network(
            "https://i.pinimg.com/originals/d6/68/ab/d668abc72809303852c27275e6a56775.gif",
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [Color(0xFF000000),
                    Color(0xFF000000)])),
        ),
        child,
      ],
    );
  }
}
