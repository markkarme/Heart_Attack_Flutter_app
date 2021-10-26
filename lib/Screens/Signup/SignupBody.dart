import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack/Cubit/HACubit.dart';
import 'package:heart_attack/Cubit/HAStates.dart';
import 'package:heart_attack/GeneralComponets/InputTextField.dart';
import 'package:heart_attack/GeneralComponets/RoundButton.dart';
import 'package:heart_attack/GeneralComponets/RoundInputField.dart';
import 'package:heart_attack/Screens/Home/Home.dart';
import 'package:heart_attack/Screens/Login/LoginPage.dart';
import 'package:heart_attack/Screens/Result/ResultBackGround.dart';
import 'package:heart_attack/Screens/Signup/SignupBackGround.dart';
import 'package:shimmer/shimmer.dart';



class SignupBody extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HACubit, HAStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var myCubit = HACubit.getCubit(context);
        return BackGroundSignup(
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
                      controller: email,
                      hintText: "New Email",
                      isPassword: false,
                      myIcon: Icons.person,

                    ),
                    InputTextField(
                      controller: password,
                      hintText: "New Password",
                      isPassword: true,
                      myIcon: Icons.security,
                    ),
                    InputTextField(
                      controller: rePassword,
                      hintText: "New Password",
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
                          text: "Sign UP",
                          onPress: () {
                            if(password.text==rePassword.text && email.text.contains("@") && password.text.length>5){
                              myCubit.signupWithFireBase(email.text, password.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Home();
                              }));
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter valid data")));
                            }
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
                            "Have already account? ",
                            style: TextStyle(fontSize: 20),
                          ),
                          InkWell(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20, decoration: TextDecoration.underline,
                                  color: Colors.blue
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return LoginPage();
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
