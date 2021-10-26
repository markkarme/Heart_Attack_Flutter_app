import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack/Cubit/HACubit.dart';
import 'package:heart_attack/Cubit/HAStates.dart';
import 'package:heart_attack/GeneralComponets/RoundButton.dart';
import 'package:heart_attack/Screens/Result/ResultBackGround.dart';
import 'package:heart_attack/Screens/Result/ResultBody.dart';
class ResultPage extends StatelessWidget {
  Map<String,dynamic> data ={};
  ResultPage({this.data});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => HACubit()..getResult(data),
      child: BlocConsumer<HACubit, HAStates>(
        listener: (context,state){
          // if (state is ReceivingResultStates){
          //   HACubit.getCubit(context).insertDB(data,HACubit.getCubit(context).result);
          // }
        },
        builder: (context,state){
          var myCubit = HACubit.getCubit(context);
          return Scaffold(
            appBar: AppBar(backgroundColor: Color(0xFFFF2E84),),
            body: ResultBody(result: myCubit.result),
          );
        },
      ),
    );
  }
}
