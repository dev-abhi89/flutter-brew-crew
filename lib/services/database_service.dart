
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbbrue/models/brew.dart';
import 'package:fbbrue/models/user.dart';
import 'package:flutter/material.dart';
class DatabaseService {
  late final String uid;

  DatabaseService({
    required this.uid
  });

  DatabaseService.WithoutUID() :uid='';

  final CollectionReference datacoll = FirebaseFirestore.instance.collection(
      'brue');

  Future dataupdate(String name, String sugar, int strength) async {
    return await datacoll.doc(uid).set({
      'name': name,
      'sugar': sugar,
      'strength': strength
    });
  }

List<Brew> _getbrewinlist(QuerySnapshot snapshot){
  return snapshot.docs.map((doc) {
    return Brew(name: doc.get('name') ?? '',
      sugar: doc.data.call()['sugar']?? '',
      strength: doc.data.call()['strength'] ??0

    );
  }).toList();
}
//userdata function
  Userdata _createUserData(DocumentSnapshot snapshot){
    print(snapshot.get('name'));
    return Userdata(
      uid: uid,
      name: snapshot.get('name'),
      suger: snapshot.get('suger'),
      strength: snapshot.get('strength')
    );

  }

  Stream<List<Brew>> get data {
    return datacoll.snapshots().map(_getbrewinlist);
  }
/*  Stream<Userdata> get userdata {
    print("cl2: $uid");
    print(datacoll.doc(uid).snapshots().single.runtimeType);
    return datacoll.doc(uid).snapshots().map(_createUserData);
  }*/


}