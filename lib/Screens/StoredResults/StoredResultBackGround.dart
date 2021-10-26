import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StoredBackGroundResult extends StatelessWidget {
  Widget child;
  StoredBackGroundResult({this.child});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [Color(0xFFFF99CC), Color(0xFF000000)])),
        ),
        child,
      ],
    );
  }
}
