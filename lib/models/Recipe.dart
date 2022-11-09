import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Recipe {
  final String titre;
  final String description;


  Recipe({
    required this.titre,
    required this.description,});

  Map<String,dynamic> toJson()=> {
    'titre':titre,
    'description':description,
  };
}