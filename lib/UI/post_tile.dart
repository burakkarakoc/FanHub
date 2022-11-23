import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_fan/services/db.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/post.dart';

class PostTile extends StatefulWidget {
  const PostTile({required this.post});
  final Post post;

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  DBservice db = DBservice();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? url1;
  Future getImage() async {
    if (widget.post.photo != null) {
      final ref =
          FirebaseStorage.instance.ref().child('/uploads/${widget.post.photo}');
      print(ref);
      var url = await ref.getDownloadURL();
      url1 = url;
    }
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeData.dark().cardColor,
      shadowColor: Colors.red,
      elevation: 8,
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 18,
        16,
        MediaQuery.of(context).size.width / 18,
        0,
      ),
      child: Padding(
        padding: EdgeInsets.all(
          MediaQuery.of(context).size.width / 36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                widget.post.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 3,
              child: widget.post.photo != null
                  ? Image(
                      fit: BoxFit.fitHeight,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 3,
                      image: NetworkImage(widget.post.photo!))
                  : const Text('No Photo'),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                widget.post.description,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            // Container(child: url1 != null ? Image.network(url1!) : Text("")),
          ],
        ),
      ),
    );
  }
}
