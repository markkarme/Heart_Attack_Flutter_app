import 'package:flutter/material.dart';

class RoundInputField extends StatelessWidget {
  var hintText;
  TextEditingController controller = TextEditingController();
  RoundInputField({this.hintText, this.controller});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.08,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(fontSize: 25),
          counterStyle: TextStyle(fontSize: 40),
          border: OutlineInputBorder(),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          errorStyle: TextStyle(color: Colors.white,fontSize: 25),
          suffixStyle: TextStyle(fontSize: 100),
        ),
        validator: (value){
          if(value == null || value.isEmpty || num.tryParse(value) == null ){
            print("valid data");
            return "please enter valid data";
          }
          return null;
        },
      ),
    );
  }
}