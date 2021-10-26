import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack/Cubit/HACubit.dart';
import 'package:heart_attack/Cubit/HAStates.dart';
import 'package:heart_attack/GeneralComponets/RoundButton.dart';
import 'package:heart_attack/Screens/Result/ResultBackGround.dart';
import 'package:heart_attack/Screens/Result/ResultBody.dart';

import 'PastResultBody.dart';

class PastResultPage extends StatelessWidget {
  PastResultPage();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HACubit()..readDB(),
      child: BlocConsumer<HACubit, HAStates>(listener: (context, state) {
        if (state is LoadingReceivingStoredResultStates) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFFF2E84),
            ),
            body: CircularProgressIndicator(),
          );
        }
      }, builder: (context, state) {
        var myCubit = HACubit.getCubit(context);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFFF2E84),
          ),
          body: PastResultBody(
            myResults: myCubit.recordedData,
          ),
        );
      }),
    );
  }
}
