import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.amber,
            size: 20,
          ),
          onPressed:(){ Navigator.pop(context);}
        ),
      ),*/

      backgroundColor: Colors.white,
      body: Container(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                height: 150,
                child: Image.asset('images/logo_foody.png'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: 50, vertical: 50),
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Email",
                          fillColor: Colors.black),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Mot de passe",
                          fillColor: Colors.black),
                    ),
                  ]),
                ),
              ),
              //SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Mot de passe oubliée ?",
                              textAlign: TextAlign.left),
                          SizedBox(height: 10),
                          OutlinedButton(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            child: Text(
                              'Valider',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(176, 27, 23, 1),
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(176, 27, 23, 1),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                          Text("Créer un compte"),
                        ],
                      ),
                    ),
                    Container(
                      //alignment: FractionalOffset.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      child: FittedBox(
                        child: Image.asset('images/lobza.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              )

              // Figma Flutter Generator Group2Widget - GROUP
              /*Container(
                          width: 299,
                          height: 537,

                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 299,
                                        height: 537,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(19),
                                            topRight: Radius.circular(19),
                                            bottomLeft: Radius.circular(19),
                                            bottomRight: Radius.circular(19),
                                          ),
                                          color : Color.fromRGBO(255, 255, 255, 1),
                                          border : Border.all(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            width: 1,
                                          ),
                                        )
                                    )
                                ),Positioned(
                                    top: 98,
                                    left: 75,
                                    child: Container(
                                        width: 148,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          image : DecorationImage(
                                              image: AssetImage('assets/images/Image1.png'),
                                              fit: BoxFit.fitWidth
                                          ),
                                        )
                                    )
                                ),Positioned(
                                    top: 233,
                                    left: 69,
                                    child: Container(
                                        width: 160,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40),
                                            bottomLeft: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                          ),
                                          color : Color.fromRGBO(0, 0, 0, 1),
                                        )
                                    )
                                ),Positioned(
                                    top: 273,
                                    left: 69,
                                    child: Container(
                                        width: 160,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40),
                                            bottomLeft: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                          ),
                                          color : Color.fromRGBO(0, 0, 0, 1),
                                        )
                                    )
                                ),Positioned(
                                    top: 241,
                                    left: 87,
                                    child: Text('E-mail', textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(255, 253, 253, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1
                                    ),)
                                ),Positioned(
                                    top: 281,
                                    left: 88,
                                    child: Text('Mot de passe', textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(255, 253, 253, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1
                                    ),)
                                ),Positioned(
                                    top: 347,
                                    left: 101,
                                    child: Container(
                                        width: 92,
                                        height: 32,

                                        child: Stack(
                                            children: <Widget>[
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                      width: 92,
                                                      height: 32,
                                                      decoration: BoxDecoration(
                                                        borderRadius : BorderRadius.only(
                                                          topLeft: Radius.circular(40),
                                                          topRight: Radius.circular(40),
                                                          bottomLeft: Radius.circular(40),
                                                          bottomRight: Radius.circular(40),
                                                        ),
                                                        border : Border.all(
                                                          color: Color.fromRGBO(176, 27, 23, 1),
                                                          width: 1,
                                                        ),
                                                      )
                                                  )
                                              ),Positioned(
                                                  top: 8,
                                                  left: 25,
                                                  child: Text('Valider', textAlign: TextAlign.left, style: TextStyle(
                                                      color: Color.fromRGBO(176, 27, 23, 1),
                                                      fontFamily: 'Inter',
                                                      fontSize: 12,
                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight: FontWeight.normal,
                                                      height: 1
                                                  ),)
                                              ),
                                            ]
                                        )
                                    )
                                ),Positioned(
                                    top: 387,
                                    left: 101,
                                    child: Text('Créer un compte ? ', textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 10,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1
                                    ),)
                                ),Positioned(
                                    top: 313,
                                    left: 134,
                                    child: Text('mot de passe oublié', textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 10,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1
                                    ),)

                                ),
                              ]
                          )
                      )*/
            ],
          ),
        ),
      ),
    );
  }
}
