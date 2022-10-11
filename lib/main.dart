import 'package:flutter/material.dart';
import 'delayedanimation.dart';
import 'Welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Foody',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Welcome()
      //const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var email,password;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: delayedanimation(delay: 1000, child: FlutterLogo(size:200),)

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
