import 'package:fbbrue/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  dynamic _createUserId(User user) {
    return user != null ? UserId(uid: user.uid) : null;
  }

//sTREAMS
  Stream<User> get user {
    return _auth.authStateChanges();
  }

  //sign in anonymously
  Future signinAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      dynamic user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  } //end
  //Resgister using email

  Future createUserWithEmailPas(String email, String pass) async {
    dynamic user;
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signin useing email pasword
  Future signinUsingEmailPass(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(
              email: email, password: pass);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
