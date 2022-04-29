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

  void getStreamReadingMessages()
{

  FirebaseDatabase.instance.ref
  ().child('users/${Auth().getCurrentUser!.displayName.toString()}/inbox').onValue.map((event) => print(event.snapshot.value));
}


}