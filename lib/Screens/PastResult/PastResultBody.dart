import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_attack/Cubit/HACubit.dart';
import 'package:heart_attack/Cubit/HAStates.dart';
import 'package:heart_attack/GeneralComponets/RoundButton.dart';
import 'package:heart_attack/Screens/Result/ResultBackGround.dart';
import 'package:heart_attack/Screens/StoredResults/StoredResultPage.dart';
import 'package:heart_attack/constants.dart';
import 'package:shimmer/shimmer.dart';

import 'PastResultBackGround.dart';

class PastResultBody extends StatelessWidget {
  List<Map> myResults;
  PastResultBody({this.myResults});
  @override
  Widget build(BuildContext context) {
    print("my result : $myResults");
    Size size = MediaQuery.of(context).size;
    if (myResults == null) {
      return Center(
          child: PastBackGroundResult(
              child: Center(child: CircularProgressIndicator())));
    } else {
      return PastBackGroundResult(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //childAspectRatio: 1 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: myResults.length,
            padding: const EdgeInsets.all(20.0),
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  print(myResults[index]);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StoredResultPage(
                      storedData: myResults[index],
                    );
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        myResults[index]["$colResult"] == "you are well"
                            ? Icons.check
                            : Icons.close,
                        size: 30,
                        color: Colors.blue[100],
                      ),
                      Text(
                        "At: ${myResults[index]["$colDate"].split(" ")[0]}",
                        style: TextStyle(fontSize: 20, color: Colors.blue[100]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${myResults[index][colResult]}",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blue[100]),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF4C454C),
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            }),
      );
    }
  }
}
