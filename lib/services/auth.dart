import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

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
  return await _auth.signInWithCredential(credential);
}
Future signOut() async 
{
  await _auth.signOut();
  await _googleSignIn.signOut();
}

User? get getCurrentUser{
    return _auth.currentUser;
}

Future addUserInBox() async
{
    var response = await put(Uri.parse("https://chat-c27ef-default-rtdb.firebaseio.com/user-inbox.json"),
    body: jsonEncode({"userid" :  _auth.currentUser?.uid} ));
   


}

Stream<User?> get getUser
{
  return _auth.authStateChanges();
}







}