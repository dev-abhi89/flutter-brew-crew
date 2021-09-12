import 'package:fbbrue/screens/auth/auth_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fbbrue/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:custom_navigator/custom_navigator.dart';

import '../../loading.dart';
import 'components/auth_template.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final _navigatorkey = GlobalKey<NavigatorState>();
  final Authservice _auth = Authservice();
  late String email;
  late String password;
  bool loading =false;
  String error = '';
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomNavigator(
      navigatorKey: _navigatorkey,
      pageRoute: PageRoutes.materialPageRoute,
      home: Scaffold(
          appBar: AppBar(
            title: Text("LOGIN"),
            backgroundColor: Colors.brown[400],
          ),
          backgroundColor: Colors.brown[100],
          body: loading? Loading(): SingleChildScrollView(
            child: Stack(alignment: Alignment.center, children: [
              Form(
                key: _formkey,
                child: AuthPageSceen(
                  onchangeEmail: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  onchangePassword: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  ontapLogin: () async {
                    if (_formkey.currentState!.validate()) {
                      try {
                        setState(() {
                          loading = true;
                        });
                        dynamic user =
                            await _auth.signinUsingEmailPass(email, password);
                        print(user);
                        if (user == null) {
                          setState(() {
                            loading =false;
                            error = 'Enter valid Email and Password';
                          });
                        }
                      } catch (e) {
                        setState(() {
                          loading = false;
                          error = e.toString();
                        });
                      }
                    }
                  },
                  btnText: "Login",
                  bottombtnText: "Signup",
                  bottomText: "Don't have an account? ",
                  bottonmBtmTap: () {
                    _navigatorkey.currentState!.push(
                        MaterialPageRoute(builder: (context) => SignupAuth()));
                  },
                ),
              ),
              Positioned(
                bottom: 200,
                child: Text(
                  error,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ]),
          )

          /*Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
          child: RaisedButton(
            onPressed: ()  async {print("sign in button");
            dynamic result = await _auth.signinAnon();
            if(result!= null){
              print("signed in");
              print(result.uid);
            }else{
              print("error in signin");
            }
              },
            child: Text("SIGN In"),
          ),
        ),*/
          ),
    );
  }
}
