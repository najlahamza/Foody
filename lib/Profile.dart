import 'package:flutter/material.dart';
import 'package:flutterproject/widgets/BottomNavBarWidget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Foody",
            style: TextStyle(
                color: Color.fromRGBO(176, 27, 23, 1),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          brightness: Brightness.light,
          actions: <Widget>[

          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('images/img.png'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Linda Bouallegue',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                    ),
                  ),
                ),

                BottomNavBarWidget(),

              ]),
          ),
        ),
      ));
  }
}
