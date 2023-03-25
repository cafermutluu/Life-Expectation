import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/calculation_of_life_expectation.dart';
import 'package:yasam_beklentisi/constants/user_data.dart';

class ResultPage extends StatelessWidget {

 final UserData userData;
 const ResultPage(this.userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Result Page",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Expanded(flex: 3, child: Center(child: Text("Expected Life Time", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)))),
          Expanded(flex: 5, child: Center(child: Text("You probably die at ${Calculation(userData).calculate()[0].round().toString()} years old.",style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white )))),
          Expanded(flex: 4, child: Center(child: Text("You lost ${Calculation(userData).calculate()[1].round().toString()} years of smoking ", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)))),

          Expanded(
              child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            shape: const ContinuousRectangleBorder(side: BorderSide.none),
            onPressed: () => {
              Navigator.pop(context),
            },
            child: const Text("Back"),
          ))
        ],
      ),
    );
  }
}
