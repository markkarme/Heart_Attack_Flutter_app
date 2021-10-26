import 'package:flutter/material.dart';

class RowWithTwoText extends StatelessWidget {
  String leftText = "";
  String rightText = "";
  RowWithTwoText({this.leftText, this.rightText});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Text(
                leftText,
                style: TextStyle(fontSize: 20, color: Colors.blue[100]),
              ),
              color:  Colors.transparent,
            ),
          ),
          SizedBox(width: size.width*0.2,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                rightText,
                style: TextStyle(fontSize: 20, color: Colors.blue[100]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
