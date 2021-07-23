import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  MyApp createState() => MyApp();

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection('Item').doc('1');

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      return snapshot.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    var x = getData();

    final title = 'Daftar Barang';

    log('data: $x');

    return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body:
              GridView.count(crossAxisCount: 3, mainAxisSpacing: 10, children: [
            Image.network(
                'https://thumbs.dreamstime.com/b/orange-fruit-green-leaves-isolated-white-background-clipping-path-full-depth-field-fresh-177726692.jpg'),
            Image.network(
                'https://m.media-amazon.com/images/I/71xXL3GsqgL._AC_SL1500_.jpg'),
            Image.network('https://picsum.photos/250?image=3'),
            Image.network('https://picsum.photos/250?image=4'),
          ]),
        ));
  }
}
