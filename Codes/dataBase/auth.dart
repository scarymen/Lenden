import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<User> googleSignIn();
}

class Auth implements BaseAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User> googleSignIn() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
    await account.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    final UserCredential authResult =
    await _firebaseAuth.signInWithCredential(credential);

    try{
      final User user  = authResult.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}