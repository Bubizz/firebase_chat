import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final result = await _auth.signInWithCredential(credential);

    if (result.additionalUserInfo!.isNewUser) {
      _addUserInBox();
    }
  }

  Future signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  User? get getCurrentUser {
    return _auth.currentUser;
  }

  Future _addUserInBox() async // creates inbox for new user
  {
    
    await FirebaseDatabase.instance.ref().child("users").update({
      
     Auth()._auth.currentUser!.displayName!: {
        "userid": _auth.currentUser!.uid,
        "photoURL": _auth.currentUser!.photoURL,
        "username": _auth.currentUser!.displayName
      }
    
    });
  }

  Stream<User?> get getUser {
    return _auth.authStateChanges();
  }
}
