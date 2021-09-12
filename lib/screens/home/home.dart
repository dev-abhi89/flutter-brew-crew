import 'package:fbbrue/models/brew.dart';
import 'package:fbbrue/screens/home/setting_form.dart';
import 'package:fbbrue/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fbbrue/services/database_service.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';
class Homescreen extends StatelessWidget {
final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void _showbuttonsheet(){
       showModalBottomSheet(context: context, builder: (context){
         return Container(
           child: SettingForm(),
         );
       });
    }

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
              FlatButton.icon(onPressed: (){_auth.signout();}, icon: Icon(Icons.logout), label: Text("Logout")),
              FlatButton.icon(onPressed: ()=> _showbuttonsheet(), icon: Icon(Icons.settings),label: Text("Setting"),)
            ],
          ),
          body: Container(
            width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
          children: [
            Positioned(
          child: Image.asset('assets/images/coffee_tower.png',width: size.width,),
        top: size.height*0.56,),
            Positioned(child: Image.asset('assets/images/coffee_heart.png',width: size.width,),
            top: size.height*0.2,
            right: 0,),
            BrewList()

          ],
          ),
          )
        ),
      ),
    );
  }
}
