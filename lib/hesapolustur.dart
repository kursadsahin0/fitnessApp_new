// ignore_for_file: prefer_const_constructors

import 'package:fitness_app1/signUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class hesapolustur extends StatefulWidget {
  @override
  State<hesapolustur> createState() => _hesapolusturState();
}

class _hesapolusturState extends State<hesapolustur> {
  String userMail;
  String password;
  String name;
  String surname;
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => signUp()));
            },
            color: Colors.white,
          ),
          title: Text(
            "Fitness App Sign Up Screen",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formAnahtari,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              SizedBox(
                height: 60,
              ),

              SizedBox(
                height: 30,
              ),

              Flexible(
                flex: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (alinanMail) {
                      setState(() {
                        userMail = alinanMail;
                      });
                      validator:
                      (alinanMail) {
                        return alinanMail.contains('@')
                            ? null
                            : 'Mail adresiniz geçersiz';
                      };
                    },
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter your e-mail',
                      // ignore: prefer_const_constructors
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      hintText: 'Enter your e-mail',
                      hintStyle: TextStyle(color: Colors.white),
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
                    style: TextStyle(color: Colors.white),
                    onChanged: (alinanParola) {
                      setState(() {
                        password = alinanParola;
                      });
                      validator:
                      (alinanParola) {
                        return alinanParola.length >= 6
                            ? null
                            : 'Parolanız en az 6 karakter olmalı';
                      };
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // ),
              Container(
                width: 200,
                child: Flexible(
                  child: RaisedButton(
                    onPressed: () {
                      sign();
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
            ],
          ),
        ),
      ),
    );
  }

  void sign() {
    if (_formAnahtari.currentState.validate()) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userMail, password: password)
          .then((user) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => signUp()),
            (Route<dynamic> route) => false);
      }).catchError((hata) {
        Fluttertoast.showToast(msg: hata);
      });
    }
  }
}
