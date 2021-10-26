import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack/Cubit/HACubit.dart';
import 'package:heart_attack/Cubit/HAStates.dart';
import 'package:heart_attack/GeneralComponets/InputTextField.dart';
import 'package:heart_attack/GeneralComponets/RoundButton.dart';
import 'package:heart_attack/GeneralComponets/RoundInputField.dart';
import 'package:heart_attack/Screens/Home/Home.dart';
import 'package:heart_attack/Screens/Result/ResultBackGround.dart';
import 'package:heart_attack/Screens/Signup/SignupPage.dart';
import 'package:shimmer/shimmer.dart';

import 'LoginBackGround.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HACubit, HAStates>(
      listener: (context, state) {
        if(state is LoginSuccessStates){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Home();
          }));
        }else if(state is LoginErrorStates){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cannot Login Enter valid data")));
        }
      },
      builder: (context, state) {
        var myCubit = HACubit.getCubit(context);
        return BackGroundLogin(
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    Container(
                      height: size.height * 0.3,
                      child: Image(
                        image: AssetImage("assets/logo2.png"),
                      ),
                    ),
                    InputTextField(
                      controller: myCubit.emailController,
                      hintText: "UserName",
                      isPassword: false,
                      myIcon: Icons.person,
                    ),
                    InputTextField(
                      controller: myCubit.passwordController,
                      hintText: "Password",
                      isPassword: true,
                      myIcon: Icons.security,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: size.width * 0.8,
                        child: RoundButton(
                          buttonColor: Colors.pinkAccent,
                          textButtonColor: Colors.black,
                          text: "Login",
                          onPress: () {
                            myCubit.loginWithFireBase(myCubit.emailController.text, myCubit.passwordController.text);
                            print(DateTime.now());
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Have account? ",
                            style: TextStyle(fontSize: 20),
                          ),
                          InkWell(
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 20, decoration: TextDecoration.underline,
                                  color: Colors.blue
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return SignupPage();
                              }));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],

          ),
        );
      },
    );
  }
}
