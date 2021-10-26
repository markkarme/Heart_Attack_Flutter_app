import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack/Cubit/HACubit.dart';
import 'package:heart_attack/Cubit/HAStates.dart';
import 'package:heart_attack/Screens/Home/Body.dart';
import 'package:heart_attack/Screens/PastResult/PastResultPage.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatelessWidget {
  var dic = {
    "age": 20,
    "gender": 1,
    "cp": 1,
    "trestbps": 1,
    "chol": 1,
    "fbs": 1,
    "restecg": 1,
    "thalach": 1,
    "exang": 1,
    "oldpeak": 1,
    "slope": 1,
    "ca": 1,
    "thal": 1
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return BlocProvider(
      create: (BuildContext context) => HACubit()..setContllerList(),
      child: BlocConsumer<HACubit, HAStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var myCubit = HACubit.getCubit(context);
            return Scaffold(
              drawer: Drawer(
                child: Container(
                  width: 100,
                  color: Colors.grey[200],
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 13,top: 30),
                        child: Text(
                          'Menu',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight:FontWeight.bold ),
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite,size: 30,),
                        title: Text('Reassure yourself',style: TextStyle(
                          fontSize: 17,
                        ),),
                        selected: myCubit.my_index == 0,
                        onTap: () {
                          myCubit.changeIndex(0);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.paste_sharp),
                        title: Text('Past Result'),
                        selected: myCubit.my_index == 1,
                        onTap: () {
                          myCubit.changeIndex(1);
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return PastResultPage();
                          }));
                          // Navigator.pop(context);
                        },
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
              body: Body(),
            );
          }),
    );
  }
}
