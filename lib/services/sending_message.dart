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
      var a = response.keys.toList()[0];
      return Message.fromJSON(Map<String,dynamic>.from(response[a] as Map<dynamic, dynamic>), Auth().getCurrentUser!.displayName.toString(), fromUser);
    }
    else
    {
      return null;
    }
    
    });
  
}


}