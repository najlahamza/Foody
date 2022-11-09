import 'package:flutter/material.dart';
import 'package:flutterproject/RecipeList.dart';
import 'package:flutterproject/Signup.dart';

import 'Routing/ScaleRoute.dart';
import 'widgets/BottomNavBarWidget.dart';
import 'widgets/SearchWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
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
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black54,
              ),
              onPressed: () =>FirebaseAuth.instance.signOut(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchWidget(),
            Text("welcome back ! "),
            Text(user.email!),
            SizedBox(height: 80),
            //RecipeList(),
            //TopMenus(),
            //PopularFoodsWidget(),
            //BestFoodWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }


}
