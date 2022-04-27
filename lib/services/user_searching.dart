

import 'dart:convert';


import 'package:chat_app/models/app_user.dart';
import 'package:firebase_database/firebase_database.dart';


class UserSearching
{
  var ref = FirebaseDatabase.instance.ref();

  Future<List<AppUser>?> searchUser(String name) async
  {
      var query = ref.child("users").orderByChild("username").startAt("M");

      var documentSnapshot =  await query.get();

      if (documentSnapshot.exists) {
        var returnedListOfUser = <AppUser>[];

        Map<String,dynamic> map = Map<String,dynamic>.from(documentSnapshot.value as Map<dynamic, dynamic>);//converts response to Map with String keys

        var names = map.keys.toList();

        for(var KeyName in names)
        {
          Map<String,dynamic> mapOfUserInfo = Map<String,dynamic>.from(map[KeyName] as Map<dynamic, dynamic>);
          returnedListOfUser.add(AppUser.fromJson(mapOfUserInfo));
        }
        return returnedListOfUser;
      } else {
        return null;
      }
    
  
  
  }






}
