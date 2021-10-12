import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/res/models/user.dart';
import 'package:firebase_practice/res/utility/preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anon
  Future signInAnon() async {
    try {
      //  AuthResult result = await _auth.signInAnonymously();
      // FirebaseUser user = result.user;
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      Preferences().adduseruid(uid: user!.uid);
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // create a new document for the user with the uid
      //  await DatabaseService(uid: user.uid).updateUserData('0','new crew member', 100);
      return _userFromFirebaseUser(user!);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // create user obj based on firebase user
  _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

// sign in with email and password

  // register with email and password

  // sign out

}
