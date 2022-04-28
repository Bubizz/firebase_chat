
import 'dart:convert';
import '../services/auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/models/Message.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatLogicHandler
{
  
  Future sendMessage(Message message) async
  {
    print(message.receiver);
    print(message.sender);
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/${message.receiver}/inbox/sender_${message.sender}");
    print(ref.path);

    ref.update({DateTime.now().millisecondsSinceEpoch.toString() : {"content": message.content, "timestamp" : message.timeStamp.toString()}});

    


    


  }


}