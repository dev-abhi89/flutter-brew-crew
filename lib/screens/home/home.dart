import 'package:fbbrue/services/auth.dart';
import 'package:flutter/material.dart';
class Homescreen extends StatelessWidget {

final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Home"),
        actions: [
          FlatButton.icon(onPressed: (){_auth.signout();}, icon: Icon(Icons.logout), label: Text("Logout"))
        ],
      ),
    );
  }
}
