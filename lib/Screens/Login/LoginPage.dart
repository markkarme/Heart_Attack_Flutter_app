import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack/Cubit/HACubit.dart';
import 'package:heart_attack/Cubit/HAStates.dart';

import 'LoginBody.dart';

class LoginPage extends StatelessWidget {
  Map<String, dynamic> data = {};
  LoginPage({this.data});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HACubit(),
      child: BlocConsumer<HACubit, HAStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var myCubit = HACubit.getCubit(context);
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.black,
            //   title: Center(
            //     child: Text(
            //       "Login",
            //       style: TextStyle(fontSize: 30, color: Color(0xFFFF2E84)),
            //     ),
            //   ),
            // ),
            body: LoginBody(),
          );
        },
      ),
    );
  }
}
