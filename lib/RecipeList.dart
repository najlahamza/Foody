import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject/Login.dart';
import 'package:flutterproject/services/Storage_service.dart';
import 'package:flutterproject/widgets/BottomNavBarWidget.dart';
import 'package:flutterproject/widgets/SearchWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final useremail=user.email;
    final String uid = user.uid;
    final CollectionReference _recipes = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection("recipes");

    Storage storage = Storage();
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
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => Login()));
            },
          )
        ],
      ),
      body: Column(children: [
        SizedBox(height: 30,),
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage('images/img.png'),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            useremail.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lobster',
            ),
          ),
        ),
        StreamBuilder(
          stream: _recipes.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              Storage storage = Storage();
              storage.ListFiles();
              return Expanded(
                child: ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: FutureBuilder(
                                  future: storage.DownloadURL(documentSnapshot.id),
                                  builder: (context, AsyncSnapshot<String> streamSnapshot) {
                                    if (streamSnapshot.hasData) {
                                      return Expanded(child: ListView.builder(itemBuilder: (context, index) {
                                        return Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 140,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(streamSnapshot.data!),
                                            ),
                                          ),
                                        );
                                        }),
                                      );
                                    }
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.9),
                                          Colors.transparent,
                                        ])),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      documentSnapshot['titre'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      documentSnapshot['description'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        BottomNavBarWidget(),
      ]),
    );
  }
}
