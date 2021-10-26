
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  var hintText;
  IconData myIcon;
  bool isPassword = false;
  TextEditingController controller = TextEditingController();
  InputTextField({this.hintText,this.myIcon,this.controller,this.isPassword});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.8,
      padding: EdgeInsets.symmetric(vertical: 1,horizontal: 7),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white,),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(hintText: hintText,
          icon: Icon(myIcon),
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.black,fontSize: 20),
        ),
      ),
    );
  }
}