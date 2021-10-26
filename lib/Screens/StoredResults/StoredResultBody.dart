import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack/Cubit/HACubit.dart';
import 'package:heart_attack/Cubit/HAStates.dart';
import 'package:heart_attack/GeneralComponets/RoundButton.dart';
import 'package:heart_attack/GeneralComponets/RowWithTwoText.dart';
import 'package:heart_attack/Screens/Home/Home.dart';
import 'package:heart_attack/Screens/Result/ResultBackGround.dart';
import 'package:heart_attack/constants.dart';
import 'package:shimmer/shimmer.dart';

import 'StoredResultBackGround.dart';

class StoredResultBody extends StatelessWidget {
  Map myStoredResults;
  StoredResultBody({this.myStoredResults});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StoredBackGroundResult(
        child: Center(
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return Home();
                }));
              },
              child: CircleAvatar(
                radius: 50,
                child: Icon(myStoredResults[colResult] == "you are well"
                    ? Icons.check
                    : Icons.close,size: 100,),
                backgroundColor: Colors.grey[800],
              ),
            ),
          ),
          RowWithTwoText(
              leftText: "Age: ${myStoredResults[colAge]}",
              rightText: "Gender: ${myStoredResults[colGender]==1?"Male":"Female"}"),
          RowWithTwoText(
              leftText: "CA: ${myStoredResults[colCA]}",
              rightText: "Trestbps: ${myStoredResults[colTrestbps]}"),
          RowWithTwoText(
              leftText: "Chol: ${myStoredResults[colChol]}",
              rightText: "FBS: ${myStoredResults[colFBS]}"),
          RowWithTwoText(
              leftText: "Restecq: ${myStoredResults[colRestecg]}",
              rightText: "Tgalach: ${myStoredResults[colTgalach]}"),
          RowWithTwoText(
              leftText: "Exang: ${myStoredResults[colExang]}",
              rightText: "Oldpeak: ${myStoredResults[colOldpeak]}"),
          RowWithTwoText(
              leftText: "Slop: ${myStoredResults[colSlop]}",
              rightText: "Oldpeak: ${myStoredResults[colCA]}"),
          RowWithTwoText(
              leftText: "THAL: ${myStoredResults[colTHAL]}",
              rightText: "Date:${myStoredResults["Date"].split(" ")[0]}"),

        ],
      ),
    ));
  }
}
