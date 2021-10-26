import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack/Cubit/HACubit.dart';
import 'package:heart_attack/Cubit/HAStates.dart';
import 'StoredResultBody.dart';
class StoredResultPage extends StatelessWidget {
  Map storedData;
  StoredResultPage({this.storedData});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => HACubit()..readDB(),
      child: BlocConsumer<HACubit, HAStates>(
        listener: (context,state){},
        builder: (context,state){
          var myCubit = HACubit.getCubit(context);
          return Scaffold(
            appBar: AppBar(backgroundColor: Color(0xFFFF2E84),),
            body: StoredResultBody(myStoredResults: storedData),
          );
        },
      ),
    );
  }
}
