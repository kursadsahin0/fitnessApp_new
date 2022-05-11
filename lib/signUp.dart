// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app1/forgot_password.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'hesapolustur.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signUp extends StatefulWidget {
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  String mail;
  String password;
  var _formAnahtari = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF1f1f1d),
        appBar: AppBar(
          backgroundColor: Color(0xFF1f1f1d),
          elevation: 0,
          leading: Icon(
            Icons.fitness_center,
            size: 30,
            color: Colors.white,
          ),
          title: Text(
            "Fitness App Login Screen",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formAnahtari,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Center(
                child: Image.network(
                  'https://thumbs.dreamstime.com/b/dumbbell-icon-fitness-center-logo-gym-icon-sport-badge-vector-dumbbell-icon-fitness-center-logo-gym-icon-sport-badge-vector-114015414.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Flexible(
                flex: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (alinanMail) {
                      setState(() {
                        mail = alinanMail;
                      });
                    },
                    validator: (alinanMail) {
                      return alinanMail.contains('@') ? null : 'Geçersiz mail';
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter your e-mail',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      hintText: 'Enter your e-mail',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Flexible(
                flex: 15,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    onChanged: (alinanPassword) {
                      setState(() {
                        password = alinanPassword;
                      });
                    },
                    validator: (alinanPassword) {
                      return alinanPassword.length >= 6
                          ? null
                          : 'Parolanız en az 6 karakter olmalı';
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter your password',
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        hintText: 'Enter your password',
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                child: Flexible(
                  child: RaisedButton(
                    onPressed: () {
                      girisYap();
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                child: Flexible(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => hesapolustur()));
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => forgot()));
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void girisYap() {
    if (_formAnahtari.currentState.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: password)
          .then((user) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
      }).catchError((hata) {
        Fluttertoast.showToast(msg: hata);
      });
    }
  }
}
