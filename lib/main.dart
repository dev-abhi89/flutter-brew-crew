import 'package:fbbrue/screens/home/home.dart';
import 'package:fbbrue/services/auth.dart';
import 'package:fbbrue/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'loading.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyAwesomeApp());
}

class MyApp extends StatelessWidget{
  get nulll => null;
final mainNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context){
    return StreamProvider<User>.value(
      value: Authservice().user,
      initialData:nulll,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.brown[700],
        ),
        navigatorKey: mainNavigatorKey,
        title: "BrueCrue App",
        home: Wrapper(),
      ),
    );
  }
}
class MyAwesomeApp extends StatefulWidget{

  _MyAwesomeAppState createState() => _MyAwesomeAppState();
}

class _MyAwesomeAppState extends State<MyAwesomeApp>{
  final Future<FirebaseApp> _intialization = Firebase.initializeApp();
  @override
Widget build(BuildContext context){
    return FutureBuilder(
      future: _intialization
        ,builder: (context,snapshot){
        if(snapshot.hasError){
          return Homescreen();
        }
        if(snapshot.connectionState==ConnectionState.done){
          return MyApp();
        }
        return MaterialApp(
  debugShowCheckedModeBanner: false,
            home: Container(
              color: Colors.brown[100],
               child: Loading()));
    },
    );
  }
}