import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbbrue/models/brew.dart';
import 'package:fbbrue/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fbbrue/services/database_service.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';
class Homescreen extends StatelessWidget {
final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Brew>>.value(
      initialData:[],
      value: DatabaseService.WithoutUID().data,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            backgroundColor: Colors.brown[400],
            title: Text("Home"),
            actions: [
              FlatButton.icon(onPressed: (){_auth.signout();}, icon: Icon(Icons.logout), label: Text("Logout"))
            ],
          ),
          body: BrewList()
        ),
      ),
    );
  }
}
