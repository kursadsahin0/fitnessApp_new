import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:getwidget/getwidget.dart';
import 'fitnessLose.dart';

class loseWeight extends StatefulWidget {
  @override
  State<loseWeight> createState() => _loseWeightState();
}

class _loseWeightState extends State<loseWeight> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1f1f1d),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF1f1f1d),
          title: Text('Lose Weight'),
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
                day10(),
                day20(),
                day30(),
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
                secondDay1(),
                secondDay2(),
                secondDay3(),
                secondDay4(),
                secondDay5(),
                fullBody(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
