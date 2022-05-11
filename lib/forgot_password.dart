// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class forgot extends StatefulWidget {
  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  String email;
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1f1f1d),
        appBar: AppBar(
          backgroundColor: Color(0xFF1f1f1d),
          elevation: 0,
          title: Text('Reset Password'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Flexible(
              flex: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: emailController,
                  // onChanged: (alinanMail) {
                  //   setState(() {
                  //     mail = alinanMail;
                  //   });
                  // },
                  validator: (email) {
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid mail'
                        : null;
                  },
                  style: TextStyle(color: Colors.white),
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
            Container(
              width: 200,
              height: 50,
              child: Flexible(
                child: RaisedButton(
                  onPressed: () {
                    resetPassword();
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future resetPassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
  }
}
