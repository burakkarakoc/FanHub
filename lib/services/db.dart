import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBservice {
  final CollectionReference postCollection =
      FirebaseFirestore.instance.collection('posts');
  Future addPost(
      // String poster,
      String title,
      String photo,
      String description
      // String date,
      // int likeCt,
      // List comments,
      // int commentCt,
      // String active,
      ) async {
    postCollection
        .add({
          // 'poster': poster,
          'title': title,
          'description': description,
          'image': photo,
          // 'date': date,
        })
        .then((value) => print("Post Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  Future addUser(String name, String email, String password) async {
    userCollection
        .doc(email)
        .set({
          'name': name,
          'email': email,
          'password': password,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
