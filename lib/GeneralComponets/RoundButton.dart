import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  var text;
  Color buttonColor;
  VoidCallback onPress;
  Color textButtonColor;
  RoundButton(
      {this.text, this.onPress, this.buttonColor, this.textButtonColor});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        //margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.08,
        height: 50,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          child: TextButton(
            child: Text(
              text,
              style: TextStyle(
                  color: textButtonColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: onPress,
          ),
        ),
        color: buttonColor,
      ),
    );
  }
}
