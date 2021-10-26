import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack/Cubit/HAStates.dart';
import 'package:heart_attack/DioHelper.dart';
import 'package:sqflite/sqflite.dart';

import '../constants.dart';

class HACubit extends Cubit<HAStates>{
  HACubit() : super(InitialStates());
  // List<TextEditingController> emailController = TextEditingController() as List<TextEditingController>;
  List<TextEditingController> controller = [];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map data ={};
  String result = "";
  String gender = "";
  var my_index = 0;
  var myDB ;
  // var recordedData = [{"id": "2", "age": "63", "Gender": "0", "CP": "3", "Trestbs": "145", 'Chol': "233", 'FBS': '1', "Restecg": "0", "Tgalach": "150", "Exang": "0", "Oldpeak":"2.3", "Slop": "0", "CA": "0", "THAL": "1", "Date": "2021-09-08 21:43:36.131658", "Result": "You are ill ,you should see a doctor"}];
  var recordedData;
  void setContllerList(){
    for(int i = 0; i<12;i++){
      controller.add(TextEditingController());
    }
    //createDB();
    emit(SetControllerListState());
  }

  void getResult(dic){
    emit(LoadingReceivingResultStates());
    DioHelper.postData("/data-result",dic).then((value) {
      print(value.toString());
      data = jsonDecode(value.toString());
      result = data["result"];
      print(result);
      insertDB(dic,result);

      emit(ReceivingResultStates());
    }).catchError((onError){
      print("Error while receiving dara $onError");
      emit(ErrorReceivingResultStates(onError));
    });
  }
  void changeIndex(int index){
    my_index = index;
    emit(BottomNavigationBarIndexChanged());
  }
  static HACubit getCubit(context){
    return BlocProvider.of(context);
  }
  void signupWithFireBase(String email,String password){
    emit(SignupLoadingStates());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      emit(SignupSuccessStates());
    }).onError((error, stackTrace) {
      emit(SignupErrorStates());
      print("error:${error.toString()}");
    });
  }
  void loginWithFireBase(String email,String password){
    emit(LoginLoadingStates());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      emit(LoginSuccessStates());
    }).onError((error, stackTrace) {
      emit(LoginErrorStates());
      print("error:${error.toString()}");
    });
  }
  void createDB() async{
    var myDB = await openDatabase(
        'HARecords.db',
        version: 1,
        onCreate: (database,version) async{
          print('creating database');
          database.execute(
              'CREATE TABLE "$tableName" (id INTEGER PRIMARY KEY, "$colAge" TEXT, $colGender TEXT,'
                  '"$colCP" TEXT,$colTrestbps TEXT,$colChol TEXT,$colFBS TEXT,$colRestecg TEXT'
                  ',$colTgalach TEXT,$colExang TEXT,$colOldpeak TEXT,$colSlop TEXT,$colCA TEXT'
                  ',$colTHAL TEXT,$colDate TEXT,$colResult TEXT)')
              .then((value){
            print('table created');
            emit(CreateDataBase());
          }).catchError((error){
            print("error found on DB is : $error");
          });
        },
        onOpen: (database){
          // readFromDB(database);
          print("DB is opened");
          emit(OpenDataBase());
        }
    ).catchError((error){
      print(error.toString());
      emit(ErrorCreateDataBase());
    });

  }
  void insertDB(Map<String,dynamic> dic,String result) async{
    var myDB = await openDatabase(
        'HARecords.db',
        version: 1,
        onCreate: (database,version) async{
          print('creating database');
          database.execute(
              'CREATE TABLE "$tableName" (id INTEGER PRIMARY KEY, "$colAge" TEXT, $colGender TEXT,'
                  '"$colCP" TEXT,$colTrestbps TEXT,$colChol TEXT,$colFBS TEXT,$colRestecg TEXT'
                  ',$colTgalach TEXT,$colExang TEXT,$colOldpeak TEXT,$colSlop TEXT,$colCA TEXT'
                  ',$colTHAL TEXT,$colDate TEXT,$colResult TEXT)')
              .then((value){
            print('table created');
            emit(CreateDataBase());
          }).catchError((error){
            print("error found on DB is : $error");
          });
        },
        onOpen: (database){
          // readFromDB(database);
          print("DB is opened");
          emit(OpenDataBase());
        }
    ).catchError((error){
      print(error.toString());
      emit(ErrorCreateDataBase());
    });

    emit(LoadingDataBase());
    myDB.transaction((txn) async {
      txn.rawInsert('INSERT INTO "$tableName" '
          '("$colAge","$colGender","$colCP","$colTrestbps","$colChol","$colFBS","$colRestecg","$colTgalach"'
          ',"$colExang","$colOldpeak","$colSlop","$colCA","$colTHAL","$colDate","$colResult") '
          'VALUES("${dic["age"]}","${dic["gender"]}","${dic["cp"]}","${dic["trestbps"]}",'
          '"${dic["chol"]}","${dic["fbs"]}","${dic["restecg"]}","${dic["thalach"]}",'
          '"${dic["exang"]}","${dic["oldpeak"]}","${dic["slope"]}","${dic["ca"]}",'
          '"${dic["thal"]}","${DateTime.now()}","${result}")').then((value){
        print('row number $value inserted Successfully');
        //readFromDB(myDB);
        emit(InsertInDataBase());
      }).catchError((onError){
        print("error found on DB is : $onError");
        emit(ErrorInsetrtingInDataBase());
      });
    });
  }
  void readDB() async{

    var database = await openDatabase("HARecords.db");
    emit(OpenDataBase());
    print("hello");
    emit(LoadingReceivingStoredResultStates());
    recordedData = await database.rawQuery('select * from "$tableName"');
    print(recordedData);
    database.close();
    emit(ReadFromDataBase());
  }

}