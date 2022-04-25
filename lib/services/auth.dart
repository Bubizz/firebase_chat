import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart';
import '../services/auth.dart';

class Auth
{
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();


Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  // Once signed in, return the UserCredential
  final result = await _auth.signInWithCredential(credential);
  if(result.additionalUserInfo!.isNewUser)
  {
    _addUserInBox();
  }
  return result;
}
Future signOut() async 
{
  await _auth.signOut();
  await _googleSignIn.signOut();
}

User? get getCurrentUser{
    return _auth.currentUser;
}

Future _addUserInBox() async // creates inbox for new user
{
     // await put(Uri.parse("https://chat-c27ef-default-rtdb.firebaseio.com/user-inbox.json"),
     // body: jsonEncode({_auth.currentUser?.displayName.toString() : {"userid" : _auth.currentUser?.uid,  "photoURL" : _auth.currentUser?.photoURL} }));
      var ref = FirebaseDatabase.instance.ref().child("user-inbox").update({Auth()._auth.currentUser!.displayName! : {"userid" : _auth.currentUser?.uid,  "photoURL" : _auth.currentUser?.photoURL} });
}

Stream<User?> get getUser
{

  return _auth.authStateChanges();
  
}











}