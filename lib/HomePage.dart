import 'package:fitness_app1/bodyBuilding.dart';
import 'package:fitness_app1/loseWeight.dart';
import 'package:flutter/material.dart';
import 'loseWeight.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFF1f1f1d),
          appBar: AppBar(
            backgroundColor: Color(0xFF1f1f1d),
            title: Text('What is your purpose of doing sports?'),
            centerTitle: true,
            elevation: 0,
            leading: Icon(Icons.fitness_center),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ))
            ],
          ),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 180,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF112B3C),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  width: 250,
                  height: 100,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loseWeight()));
                    },
                    icon: Icon(
                      Icons.run_circle,
                      color: Colors.white,
                      size: 35,
                    ),
                    label: Text(
                      'Lose Weight',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF112B3C),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  width: 250,
                  height: 100,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => bodyBuilding()));
                    },
                    icon: Icon(
                      Icons.fitness_center,
                      size: 35,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Body Building',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
