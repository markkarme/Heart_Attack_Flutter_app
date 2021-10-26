import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heart_attack/DioHelper.dart';
import 'package:heart_attack/Screens/Home/Home.dart';

import 'BlocObserver.dart';
import 'Screens/Login/LoginPage.dart';

void main() async{
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}
