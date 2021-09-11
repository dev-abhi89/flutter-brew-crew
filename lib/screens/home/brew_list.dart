import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbbrue/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:fbbrue/services/database_service.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<List<Brew>>(context);
    //print(brew?.docs.single.data());
    if(brew!=null){
    brew.forEach((brue) {
      print(brue.name);
      print(brue.sugar);
      print(brue.strength);
    });
    }
    return Container();
  }
}
