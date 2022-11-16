import 'dart:io';
import 'models/Ingredient.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterproject/Home.dart';
import 'package:flutterproject/Ingredients.dart';
import 'package:flutterproject/Login.dart';
import 'package:flutterproject/models/Recipe.dart';
import 'package:flutterproject/services/Storage_service.dart';
import 'package:flutterproject/widgets/BottomNavBarWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'main.dart';
import 'package:file_picker/file_picker.dart';

class AddRecipe extends StatefulWidget {
  
  const AddRecipe({Key? key}) : super(key: key);
  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var image;

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
  
  List<Ingredient> ingredientsget =[];
  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Ajouter Recette",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(176, 27, 23, 1),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsetsDirectional.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Form(
                      key: formKey,
                      child: Column(children: [
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.black54),
                              hintText: "Titre",
                              fillColor: Colors.white70),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value == null ? 'Please fill all fields' : null,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "    Upload photo",
                              style: TextStyle(color: Colors.black54),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.photo,
                                color: Colors.black54,
                              ),
                              onPressed: () async {
                                image = await FilePicker.platform.pickFiles(
                                  allowMultiple: false,
                                  type: FileType.custom,
                                  allowedExtensions: ['png', 'jpg'],
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: 4,
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.black54),
                            hintText: "Description",
                            fillColor: Colors.white70,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value == null ? 'Please fill all fields' : null,
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 200,
                          child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 3.0,
                            mainAxisSpacing: 3.0,
                            childAspectRatio: 2,
                            children:
                                List.generate(ingredientList.length, (index) {
                              return Center(
                                  child: Ingredients(
                                ing: ingredientList[index],
                              ));
                            }),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          child: Text(
                            'Ajouter',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(176, 27, 23, 1),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          onPressed: () {
                            CreateRecipe(
                                title: _titleController.text,
                                description: _descriptionController.text);
                          },
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }

  Future CreateRecipe(
      {required String title, required String description}) async {
    String uid = (await FirebaseAuth.instance.currentUser!).uid;

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      final recipe = new Recipe(titre: title, description: description);
      var UserDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      var recipeDoc = UserDoc.collection("recipes").doc();
      var ingredientDoc = recipeDoc.collection("ingredients").doc();

      await recipeDoc.set(recipe.toJson());
      List<Ingredient> selected=AddIngredients();
      for (int i=0; i<selected.length;i++) {
        await ingredientDoc.set(selected[i].toJson());

      }
      _getFromGallery(context, image, recipeDoc);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Recette ajouté !")));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Home()));
    } on FirebaseException catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }


  List<Ingredient> AddIngredients() {
    List<Ingredient> selectedingredientList=[];

    for (int i=0;i<ingredientList.length;i++)
    {
      if (ingredientList[i].selected){
        selectedingredientList.add(ingredientList[i]);
      }
    }
    return selectedingredientList;
  }
}


_getFromGallery(context, image, recipeDoc) async {
  final Storage storage = Storage();

  if (image != null) {
    final path = image.files.single.path!;
    final name = recipeDoc.id;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(recipeDoc.id)));
    storage.Uploadimage(path, name).then((value) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("file uploaded"))));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("failed")));
  }
}
