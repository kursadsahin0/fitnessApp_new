import 'package:flutter/material.dart';
import 'fitnessBuild.dart';
import 'fitnessLose.dart';
import 'forgot_password.dart';

class bodyBuilding extends StatefulWidget {
  @override
  State<bodyBuilding> createState() => _bodyBuildingState();
}

class _bodyBuildingState extends State<bodyBuilding> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1f1f1d),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF1f1f1d),
          title: Text('Body Building'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.fitness_center),
            onPressed: () {},
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                day10s(),
                day20s(),
                day30s(),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  height: 30,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'If you have a fitness background, you can skip the first month.',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Every Month',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                secondDay1s(),
                secondDay2s(),
                secondDay3s(),
                secondDay4s(),
                secondDay5s(),
                fullBody(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
