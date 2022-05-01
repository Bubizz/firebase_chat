import 'package:chat_app/models/Message.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:chat_app/services/auth.dart';

class ChatLogicHandler
{
  
  Future sendMessage(Message message) async
  {
  
   DatabaseReference ref = FirebaseDatabase.instance.ref("users/${message.receiver}/inbox/sender_${message.sender}");
  
   return await ref.update({DateTime.now().millisecondsSinceEpoch.toString() : {"content": message.content, "timestamp" : message.timeStamp.toString()}});
  }

  Stream<Message?> getStreamReadingMessages(String fromUser)
{
  
  return FirebaseDatabase.instance.ref().child('users/${Auth().getCurrentUser!.displayName.toString()}/inbox/sender_' + fromUser).limitToLast(1).onValue.map((event)
   { 
    if(event.snapshot.exists)
    {
      var response = event.snapshot.value as Map<dynamic, dynamic>;
      var messageid = response.keys.toList()[0];
      return Message.fromJSON(Map<String,dynamic>.from(response[messageid] as Map<dynamic, dynamic>), Auth().getCurrentUser!.displayName.toString(), fromUser);
    }
    else
    {
      return null;
    }
    
    });
  
}

 Future<List<Message>> loadMessages(String fromUser) async
 {
   var list = <Message>[];
   var data = await FirebaseDatabase.instance.ref().child('users/${Auth().getCurrentUser!.displayName.toString()}/inbox/sender_' + fromUser).get();
   var map = data.value as Map<dynamic, dynamic>;
   var names = map.keys.toList();
   for(var KeyName in names) // extracts data for every user
        {
        
          list.add(Message.fromJSON(Map<String,dynamic>.from(map[KeyName] as Map<dynamic, dynamic>), "bebe", fromUser));

        }
  return list;
 }

//{1651437317013: {content: elo2, timestamp: 2022-05-01 22:35:17.012341}, 1651437314386: {content: elo, timestamp: 2022-05-01 22:35:14.376651}, 1651437385486: {content: www, timestamp: 2022-05-01 22:36:25.485957}}

}