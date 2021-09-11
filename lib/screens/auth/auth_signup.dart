import 'package:custom_navigator/custom_navigation.dart';
import 'package:fbbrue/screens/auth/authenticate.dart';
import 'package:fbbrue/screens/auth/components/auth_template.dart';
import 'package:fbbrue/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SignupAuth extends StatefulWidget {
  const SignupAuth({Key? key}) : super(key: key);

  @override
  _SignupAuthState createState() => _SignupAuthState();
}

class _SignupAuthState extends State<SignupAuth> {
 final _navigatorkey = GlobalKey<NavigatorState>();
  final _auth = Authservice();
  final _formkey = GlobalKey<FormState>();
 late String email;
 late String password;
  String error='';
  @override
  Widget build(BuildContext context) {
    return CustomNavigator(
      pageRoute: PageRoutes.materialPageRoute,
      navigatorKey: _navigatorkey,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          backgroundColor: Colors.brown[400],
        ),
        backgroundColor: Colors.brown[100],
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children:[ Form(
              key: _formkey,
              child: AuthPageSceen(
                onchangePassword: (val){
                  setState(() {
                    password=val;
                  });
                },
                onchangeEmail: (val){
                  setState(() {
                    email=val;
                  });
                },
                btnText: "Signup",
                ontapLogin: () async {if(_formkey.currentState!.validate()){
                dynamic user = await _auth.createUserWithEmailPas(email, password);
                print(user.runtimeType);
                if(user==null){
                  print("usnull heer ");
                  print(user.runtimeType);
                 setState(() {
                   error= 'enter an valid email address';
                 });
                  print(error);
                }
                }

                },
                bottombtnText: "Login",
                bottonmBtmTap: (){_navigatorkey.currentState!.push(MaterialPageRoute(builder: (context){
                  return Authenticate();
                }));},
                bottomText:"Already have an account" ,
              ),
            ),
            SizedBox(height: 50,),

            Positioned(
              bottom: 200,
              child: Text(error,style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),),
            ),

            ]
          ),
        ),
      ),
    );
  }
}
