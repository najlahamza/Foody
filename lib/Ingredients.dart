import 'package:flutter/material.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({Key? key}) : super(key: key);

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {

  Color _backcolor= Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 5),

      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 4,top: 0,right: 4,bottom: 0),
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Text(
                  'Légumes',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_backcolor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),),
                onPressed: () {
                  setState(() {
                    _backcolor= Color.fromRGBO(176, 27, 23, 1);
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 4,top: 0,right: 4,bottom: 0),
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Text(
                  'Légumes',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_backcolor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),),
                onPressed: () {
                  setState(() {
                    _backcolor= Color.fromRGBO(176, 27, 23, 1);
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 4,top: 0,right: 4,bottom: 0),
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Text(
                  'Légumes',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_backcolor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),),
                onPressed: () {
                  setState(() {
                    _backcolor= Color.fromRGBO(176, 27, 23, 1);
                  });
                },
              ),
            ),
          ),
        ],

      ),

    );
  }
}
