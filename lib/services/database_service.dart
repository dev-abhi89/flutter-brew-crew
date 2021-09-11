
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbbrue/models/brew.dart';
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
    return Brew(name: doc.data.call()['name'] ?? '',
      sugar: doc.data.call()['sugar']?? '',
      strength: doc.data.call()['strength'] ??0

    );
  }).toList();
}


  Stream<List<Brew>> get data {
    return datacoll.snapshots().map(_getbrewinlist);
  }


}