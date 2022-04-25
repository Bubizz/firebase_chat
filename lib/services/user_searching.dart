

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';


class UserSearching
{
  Future<Map<String, dynamic>?> searchUser(String name) async
  {

    

    // The key of any non-root reference is the last token in the path
    var ref = FirebaseDatabase.instance.ref();
   
    var m = ref.child("user-inbox").orderByKey().startAt("Ka");
    
 
    m.get().then((documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.value}');
        jsonDecode(documentSnapshot.value as String);
        return null;

      } else {
        print('Document does not exist on the database');
        throw Error();
      }
    });
  
  
  }






}