import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbbrue/loading.dart';
import 'package:fbbrue/screens/auth/components/text_decoration.dart';
import 'package:fbbrue/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formkey = GlobalKey<FormState>();
  final  Sugers = ['0','1','2','3','4'];
   late String? dropdownValue=null;
   late String? _currentName=null;
   late String? _currentsugar = null;
   late int? _currentstrength = null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final usr = Provider.of<User>(context);
print("callimgs : ${usr.uid}");
    return StreamBuilder<QuerySnapshot>(
      stream:FirebaseFirestore.instance.collection('brue')
          .where(usr.uid).snapshots() ,
      builder: (context,  snapshot) {
        if(snapshot.hasData){
           var coll = snapshot.data!.docs[0] ;
          print(coll);
          return Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [Colors.white,Colors.brown.shade100]
                )
            ),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Textdecoration(child: TextFormField(
                    initialValue: _currentName??coll['name']??'losding',
                    validator: (val)=> val!.isEmpty ? "enter value":null
                    ,onChanged: (val){setState(() {
                    _currentName=val;
                  });},
                    decoration: InputDecoration(
                        icon: Icon(Icons.person_outline,color: Colors.brown[600],),
                        hintText:"Name",
                        fillColor: Colors.brown[500]
                    ),
                  )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: size.width*0.08),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown.shade300,width: 3)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chooses Strength",textAlign: TextAlign.left,style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),),
                        Slider(value: (_currentstrength??coll['strength']??100).toDouble(),
                          onChanged: (val) {
                            setState(() {
                              _currentstrength=val.round();
                            });
                          },
                          min: 100.0,
                          max: 900.0,
                          divisions: 8,
                          activeColor: Colors.brown[_currentstrength??coll['strength']??100],
                          inactiveColor:Colors.brown[_currentstrength?? coll['strength']??100] ,),
                      ],
                    ),
                  ),

                  Textdecoration(
                    child: DropdownButtonFormField<String>(
                      value: _currentsugar??coll['sugar']??'0',
                      onChanged: (val){ setState(() {
                        _currentsugar=val;
                      });},
                      icon: Icon(Icons.coffee),
                      items: Sugers.map((suger) {
                        return DropdownMenuItem<String>(child: Text("$suger sugar"),
                            value: suger);
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: size.width*0.8,
                    height: size.height*0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.brown[400],
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              spreadRadius: 4.0,
                              blurRadius: 10.0,
                              offset: Offset(5,5),
                              color: Colors.grey
                          )
                        ]
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        if(_formkey.currentState!.validate()){
                        await  DatabaseService(uid:usr.uid).dataupdate(
                            _currentName??coll['name'],
                            _currentsugar??coll['sugar'],
                            _currentstrength??coll['strength']);
                        print("ddddoooonnnnneeee");
                        }
                      },
                      child: Text("Update",textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.brown[100]
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else {
          print(snapshot.data);
          return Loading();        }

      }
    );
  }
}
