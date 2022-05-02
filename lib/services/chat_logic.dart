import 'package:chat_app/models/message.dart';
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
   var user = Auth().getCurrentUser!.displayName;
   var list = <Message>[];
   var messagesReceived = await FirebaseDatabase.instance.ref().child('users/$user/inbox/sender_' + fromUser).get();
   var messagesSent = await FirebaseDatabase.instance.ref().child('users/$fromUser/inbox/sender_$user').get();
   if(messagesReceived.exists)
   {
   var map = messagesReceived.value as Map<dynamic, dynamic>;
   var messagesId = map.keys.toList();
  
   for(var KeyName in messagesId) // extracts data for every message
        {
          list.add(Message.fromJSON(Map<String,dynamic>.from(map[KeyName] as Map<dynamic, dynamic>), user!, fromUser));

        }
   }
   if(messagesSent.exists)
   {
   var map2 = messagesSent.value as Map<dynamic, dynamic>;

   var names2 = map2.keys.toList();

   for(var KeyName in names2) // extracts data for every message
        {
          list.add(Message.fromJSON(Map<String,dynamic>.from(map2[KeyName] as Map<dynamic, dynamic>), fromUser, user!));
        }
   }
  list.sort(((a, b) => b.timeStamp!.compareTo(a.timeStamp!)));

  

  return list;
 }

 



}