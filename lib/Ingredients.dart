import 'package:flutter/material.dart';

import 'models/Ingredient.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({Key? key, required this.ing}) : super(key: key);
  final Ingredient ing;

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  bool pressed=false;
  @override
  Widget build(BuildContext context) {

    Color pressedcolor= Color.fromRGBO(176, 27, 23, 1);
    Color notpressedcolor= Colors.black38;

    return  Padding(
      padding: EdgeInsets.all(5),
      child: Center(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(

                icon: Icon(widget.ing.icon,size:20, color: Colors.black),
                label: Text(
                  widget.ing.title,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: pressed? MaterialStateProperty.all(pressedcolor) : MaterialStateProperty.all(notpressedcolor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                onPressed: () => {
                        setState (() {
                          pressed = !pressed;
                        }),
                        if(pressed){
                          widget.ing.selected=true
                        }

                      }),
            ]
        ),
      ),
    );
  }


}

/*
class Ingredients extends StatelessWidget {
  const Ingredients({Key? key, required this.ing}) : super(key: key);
  final Ingredient ing;

  @override
  Widget build(BuildContext context) {
    Color staticColor=Colors.red;
    Color pressedColor=Colors.yellow;
    return  Container(
      child: Center(
        child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                    icon: Icon(ing.icon,size:20, color: Colors.black),
                    label: Text(
                      ing.title,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(staticColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if(staticColor!=pressedColor)
                      {staticColor=pressedColor;}
                      else{
                        staticColor=Colors.red;
                      }
                    },
                  ),
                ]
            ),
      ),
    );
  }
}*/

