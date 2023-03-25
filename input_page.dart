// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/constants/user_data.dart';
import 'package:yasam_beklentisi/result_page.dart';
import 'package:yasam_beklentisi/widgets/container_widget.dart';
import 'package:yasam_beklentisi/widgets/gender_widget.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  String? currentGender;
  double smokedWeed = 20.0;
  double startedSmokingAge = 15.0;
  int currentHeight = 170;
  int currentWeight = 60;
  int currentAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainerWidget(
                    child: rotatedBoxMethod("Height"),
                  ),
                ),
                Expanded(
                  child: MyContainerWidget(
                    child: rotatedBoxMethod("Weight"),
                  ),
                ),
                Expanded(
                  child: MyContainerWidget(
                    child: rotatedBoxMethod("Age"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainerWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Age of starting smoking",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    startedSmokingAge.round().toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                  Slider(
                    inactiveColor: Colors.black45,
                    activeColor: Colors.black45,
                    divisions: 12,
                    min: 12.0,
                    max: 24.0,
                    value: startedSmokingAge,
                    onChanged: (double newValue) {
                      setState(() {
                        startedSmokingAge = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainerWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Count of smoked cigarettes",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "*Daily Average*",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    smokedWeed.round().toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                  Slider(
                    activeColor: Colors.black45,
                    inactiveColor: Colors.black45,
                    divisions: 30,
                    min: 0.0,
                    max: 30.0,
                    value: smokedWeed,
                    onChanged: (double newValue) {
                      setState(() {
                        smokedWeed = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainerWidget(
                    onPress: () {
                      setState(() {
                        currentGender = "Male";
                      });
                    },
                    containerColor:
                        currentGender == "Male" ? Colors.yellow : Colors.white,
                    child: GenderWidget(
                      genderIcon: Icons.male,
                      genderText: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainerWidget(
                      onPress: () {
                        setState(() {
                          currentGender = "Female";
                        });
                      },
                      containerColor: currentGender == "Female"
                          ? Colors.yellow
                          : Colors.white,
                      child: GenderWidget(
                        genderIcon: Icons.female,
                        genderText: "Female",
                      )),
                ),
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
              onPressed: () {
                if(currentGender != null) {Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                        UserData(
                          currentGender: currentGender,
                          smokedWeed: smokedWeed,
                          startedSmokingAge: startedSmokingAge,
                          currentHeight: currentHeight,
                          currentWeight: currentWeight,
                          currentAge: currentAge,
                        ),
                      )),
                );} else {
                  final snackBar = SnackBar(
                    content: const Text('cinsiyet seç amk'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                  },
              child: Text("Calculate",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45))),
         /* AlertDialog(
            title: Text("My title"),
            content: Text("This is my message."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"),
              ),
            ],
          ),
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog();
              })*/
        ],
      ),
    );
  }

  Row rotatedBoxMethod(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
        ),
        RotatedBox(
          quarterTurns: 1,
          child: Text(
              (label == "Weight")
                  ? currentWeight.round().toString()
                  : (label == "Height")
                      ? currentHeight.round().toString()
                      : currentAge.round().toString(),
              style: TextStyle(fontSize: 20)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.black45,
              ),
              onPressed: () {
                setState(() {
                  label == "Weight"
                      ? currentWeight++
                      : label == "Height"
                          ? currentHeight++
                          : currentAge++;
                });
              },
              child: Icon(Icons.add),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.black45,
              ),
              onPressed: () {
                setState(() {
                  label == "Weight"
                      ? currentWeight--
                      : label == "Height"
                          ? currentHeight--
                          : currentAge--;
                });
              },
              child: Icon(Icons.horizontal_rule_outlined),
            ),
          ],
        )
      ],
    );
  }
}
