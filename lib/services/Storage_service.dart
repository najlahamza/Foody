import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as Firebase_Storage;
import 'package:flutter/material.dart';

class Storage {
  final Firebase_Storage.FirebaseStorage storage=Firebase_Storage.FirebaseStorage.instance;

  Future<void> Uploadimage(String filePath, String fileName) async{

        File file=File(filePath);
        try{
          await storage.ref('recipes/$fileName').putFile(file);
        }on Firebase_Storage.FirebaseException catch(e){
          print(e);
        }
  }

  Future<Firebase_Storage.ListResult>ListFiles() async {
    Firebase_Storage.ListResult images= await storage.ref('recipes').listAll();
    images.items.forEach((Firebase_Storage.Reference ref) {
        print('$ref');
    });
    return  images;
  }
}