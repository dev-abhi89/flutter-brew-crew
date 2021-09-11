import 'package:fbbrue/screens/auth/auth_signup.dart';
import 'package:fbbrue/screens/auth/authenticate.dart';
import 'package:fbbrue/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fbbrue/models/user.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    if(user==null){
    return Authenticate();}
    else{
      return Homescreen();
    }
  }
}
