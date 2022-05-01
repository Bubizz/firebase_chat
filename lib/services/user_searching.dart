

import 'package:chat_app/models/app_user.dart';
import 'package:firebase_database/firebase_database.dart';


class UserSearching
{
  var ref = FirebaseDatabase.instance.ref();

  var returnedListOfUser = <AppUser>[];

  Future<List<AppUser>> searchUser(String name) async
  {
      late DataSnapshot documentSnapshot;
      var query = ref.child("users").orderByChild("username").startAt(name).endAt("$name\uf8ff"); //creates query 
      try
      {
      documentSnapshot =  await query.get().timeout(const Duration(seconds: 5),onTimeout: (() => throw Exception("It takes too long")));
      }
      catch(e)
      {
        rethrow;
      }

      if (documentSnapshot.exists) {
     
     
        Map<String,dynamic> map = Map<String,dynamic>.from(documentSnapshot.value as Map<dynamic, dynamic>);//converts response to Map with String keys

        var names = map.keys.toList();

        for(var KeyName in names) // extracts data for every user
        {
          Map<String,dynamic> mapOfUserInfo = Map<String,dynamic>.from(map[KeyName] as Map<dynamic, dynamic>);

          returnedListOfUser.add(AppUser.fromJson(mapOfUserInfo)); //adds user to list
        }
      
      }
      return returnedListOfUser;

    
  
  
  }






}
