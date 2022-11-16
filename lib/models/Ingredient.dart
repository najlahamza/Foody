import 'package:flutter/material.dart';

class Ingredient {
  final String title;
  final IconData icon;
   bool selected;
   Ingredient({required this.selected,required this.title,required this.icon});

  Map<String,dynamic> toJson()=> {
    'title':title,
  };
}