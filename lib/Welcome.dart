import 'dart:async';
//import 'dart:js';
import 'package:flutter/material.dart';
import 'delayedanimation.dart';
import 'Login.dart';
import 'dart:async';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    //super.initState();
    Timer(
        Duration(seconds: 3),
            ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>
            Login())));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 150,
            horizontal: 80,
          ),
          child: Column(
            children:[
              delayedanimation(delay: 1500,
                child:Container(

                  height: 200 ,
                  child: Image.asset('images/logo_foody.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
class Welcome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          Login()));
    });
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body:SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 150,
              horizontal: 80,
            ),
            child: Column(
              children:[
               delayedanimation(delay: 1500,
                   child:Container(

                 height: 200 ,
                     child: Image.asset('images/logo_foody.png'),
               ),
               )
              ],
            ),
          ),
      ),
    );
  }
}*/
