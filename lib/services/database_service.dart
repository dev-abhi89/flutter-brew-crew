
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{
 late final  String uid;
 DatabaseService({
   required this.uid
});
  final CollectionReference datacoll = FirebaseFirestore.instance.collection('brue');

Future dataupdate(String name, String sugar, int strength) async {
  return await datacoll.doc(uid).set({
    'name':name,
    'sugar':sugar,
    'strength':strength
  });
}


}