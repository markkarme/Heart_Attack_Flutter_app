import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heart_attack/Cubit/HACubit.dart';
import 'package:heart_attack/Cubit/HAStates.dart';
import 'package:heart_attack/GeneralComponets/RoundButton.dart';
import 'package:heart_attack/GeneralComponets/RoundInputField.dart';
import 'package:heart_attack/Screens/Home/BackGround.dart';
import 'package:heart_attack/Screens/Result/ResultPage.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shimmer/shimmer.dart';

class Body extends StatelessWidget {
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'MaleValue',
      'label': 'Male',
      'icon': FaIcon(FontAwesomeIcons.mars),
    },
    {
      'value': 'femaleValue',
      'label': 'Female',
      'icon': FaIcon(FontAwesomeIcons.venus,),
      // 'textStyle': TextStyle(color: Colors.red),
    },

  ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HACubit, HAStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var myCubit = HACubit.getCubit(context);
            Size size = MediaQuery.of(context).size;
            return BackGround(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Container(
                      height: 100,
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        centerTitle: true,
                        title: Shimmer.fromColors(
                            baseColor: Colors.blue[500],
                            highlightColor: Colors.blue[100],
                            child: Text(
                              "Heart Attack Predictor",
                              style: TextStyle(fontSize: size.width*0.07),
                            )),
                      ),
                    ),
                    RoundInputField(
                      controller: myCubit.controller[0],
                      hintText: "age",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectFormField(
                        initialValue: 'MaleValue',
                        icon: FaIcon(FontAwesomeIcons.transgender),
                        labelText: 'Gender',
                        items: _items,
                        onChanged: (val) {
                          myCubit.gender = val;
                          print("val:$val");
                          print("gender:${myCubit.gender}");
                        } ,
                      ),
                    ),
                    RoundInputField(
                      controller: myCubit.controller[1],
                      hintText: "CP",
                    ),
                    RoundInputField(
                      controller: myCubit.controller[2],
                      hintText: "Trestbps",
                    ),
                    RoundInputField(
                      controller: myCubit.controller[3],
                      hintText: "CHOL",
                    ),
                    RoundInputField(
                      controller: myCubit.controller[4],
                      hintText: "FBS",
                    ),
                    RoundInputField(
                      controller: myCubit.controller[5],
                      hintText: "Restecg",
                    ),
                    RoundInputField(
                      controller: myCubit.controller[6],
                      hintText: "Tgalach",
                    ),RoundInputField(
                      controller: myCubit.controller[7],
                      hintText: "Exang",
                    ),RoundInputField(
                      controller: myCubit.controller[8],
                      hintText: "Oldpeak",
                    ),RoundInputField(
                      controller: myCubit.controller[9],
                      hintText: "Slope",
                    ),RoundInputField(
                      controller: myCubit.controller[10],
                      hintText: "CA",
                    ),RoundInputField(
                      controller: myCubit.controller[11],
                      hintText: "THAL",
                    ),
                    RoundButton(
                      onPress: () {
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          // myCubit.getResult();
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ResultPage(data: {
                              "age":myCubit.controller[0].text,
                              "gender":myCubit.gender=="MaleValue"?1:0,
                              "cp":myCubit.controller[1].text,
                              "trestbps":myCubit.controller[2].text,
                              "chol":myCubit.controller[3].text,
                              "fbs":myCubit.controller[4].text,
                              "restecg":myCubit.controller[5].text,
                              "thalach":myCubit.controller[6].text,
                              "exang":myCubit.controller[7].text,
                              "oldpeak":myCubit.controller[8].text,
                              "slope":myCubit.controller[9].text,
                              "ca":myCubit.controller[10].text,
                              "thal":myCubit.controller[11].text
                            },);
                          }));
                        }
                      },
                      text: "press",
                      textButtonColor: Colors.white,
                      buttonColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          });
  }
}
