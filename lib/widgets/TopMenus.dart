import 'package:flutter/material.dart';
import 'package:flutterproject/models/Ingredient.dart';
import 'package:flutterproject/Ingredients.dart';


class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  List<Ingredient> ingredientList = [
    Ingredient(title: 'legumes', icon: Icons.food_bank, selected: false),
    Ingredient(title: 'Fruits', icon: Icons.ballot, selected: false),
    Ingredient(title: 'Eggs', icon: Icons.circle, selected: false),
    Ingredient(title: 'Milk', icon: Icons.rectangle, selected: false),
    Ingredient(title: 'salt', icon: Icons.point_of_sale, selected: false),
    Ingredient(title: 'sugar', icon: Icons.point_of_sale_rounded, selected: false),
    Ingredient(title: 'pasta', icon: Icons.line_style, selected: false),
    Ingredient(title: 'water', icon: Icons.stay_current_portrait_sharp, selected: false),
    Ingredient(title: 'choco', icon: Icons.table_chart, selected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
         Ingredients(ing: ingredientList[0]),

          Ingredients(ing: ingredientList[1]),
          Ingredients(ing: ingredientList[2]),
          Ingredients(ing: ingredientList[3]),
          Ingredients(ing: ingredientList[4]),
          Ingredients(ing: ingredientList[5]),
          Ingredients(ing: ingredientList[6]),
          Ingredients(ing: ingredientList[7]),
          Ingredients(ing: ingredientList[8]),
          /*TopMenuTiles(name: "Burger", imageUrl: "ic_burger", slug: ""),
          TopMenuTiles(name: "Sushi", imageUrl: "ic_sushi", slug: ""),
          TopMenuTiles(name: "Pizza", imageUrl: "ic_pizza", slug: ""),
          TopMenuTiles(name: "Cake", imageUrl: "ic_cake", slug: ""),
          TopMenuTiles(name: "Ice Cream", imageUrl: "ic_ice_cream", slug: ""),
          TopMenuTiles(name: "Soft Drink", imageUrl: "ic_soft_drink", slug: ""),
          TopMenuTiles(name: "Burger", imageUrl: "ic_burger", slug: ""),
          TopMenuTiles(name: "Sushi", imageUrl: "ic_sushi", slug: ""),*/
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String slug;

  TopMenuTiles(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 25.0,
                offset: Offset(0.0, 0.75),
              ),
            ]),
            child: Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                      child: Image.asset(
                    'assets/images/topmenu/' + imageUrl + ".png",
                    width: 24,
                    height: 24,
                  )),
                )),
          ),
          Text(name,
              style: TextStyle(
                  color: Color(0xFF6e6e71),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
