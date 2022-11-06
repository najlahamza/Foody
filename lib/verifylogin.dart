import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterproject/Home.dart';
import 'package:flutterproject/Login.dart';

class verifylogin extends StatelessWidget {
  const verifylogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return Home();
          }else {
            return Login();
          }
      },
      )
    );
  }
}
