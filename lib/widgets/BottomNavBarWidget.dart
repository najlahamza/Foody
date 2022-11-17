import 'package:flutter/material.dart';
import 'package:flutterproject/AddRecipe.dart';
import 'package:flutterproject/Home.dart';
import 'package:flutterproject/Profile.dart';
import 'package:flutterproject/RecipeList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        if(_selectedIndex==1) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => AddRecipe()));
        }
        else if(_selectedIndex==0) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => Home()));
        }
        else if(_selectedIndex==2) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => RecipeList()));
        }
      });
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label:
            'Home',
           
          ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 
            'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label:
            'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color.fromRGBO(176, 27, 23, 1),
      onTap: _onItemTapped,
    );
  }
}
