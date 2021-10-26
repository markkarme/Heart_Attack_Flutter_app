import 'package:flutter/material.dart';
import 'package:heart_attack/Screens/Result/ResultBackGround.dart';

class ResultBody extends StatelessWidget {
  String result = "";
  ResultBody({this.result});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pad =  size.width * 0.2;
    if (result == "") {
      return BackGroundResult(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Center(child: Container(child: CircularProgressIndicator())),
        ),
      );
    } else {
      return BackGroundResult(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:25 ),
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 40, color: Color(0xFFFF2E84)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),

            ),

          ],
        ),
      );
    }
  }
}
