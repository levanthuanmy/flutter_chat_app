import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/models/my_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // convert Firebase User to MyUser
  MyUser? _getUserFromFirebase(User? fbUser) {
    if (fbUser != null) {
      return MyUser(
        id: fbUser.uid,
        name: fbUser.displayName ?? "",
        email: fbUser.email ?? "",
        avatar: fbUser.photoURL,
      );
    } else {
      return null;
    }
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_getUserFromFirebase);
  }

  // sign in anonymous
  Future<MyUser?> signInAnonymous() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return _getUserFromFirebase(userCredential.user);
    } catch (e) {
      print('[ERROR] Sign in anonymous: ${e.toString()}');
      return null;
    }
  }

  // sign in w/ email & password

  // register w/ email & password
  Future<MyUser?> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _getUserFromFirebase(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('[ERROR] Register: The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('[ERROR] Register: The account already exists for that email.');
      } else {
        print('[ERROR] Register: ${e.toString()}');
      }
      return null;
    } catch (e) {
      print('[ERROR] Register: ${e.toString()}');
      return null;
    }
  }

  // sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('[ERROR] Sign out: ${e.toString()}');
    }
  }
}
