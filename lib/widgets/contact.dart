import 'package:chat_app/models/ChatScreenArguments.dart';
import 'package:flutter/material.dart';
import '../screens/chat.dart';

class Contact extends StatelessWidget {
  const Contact({ Key? key, required this.photoURL, required this.username }) : super(key: key);

  final String photoURL;
  final String username;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Chat.routeName,arguments: ChatScreenArguments(username, photoURL)),
      child: ListTile(
        leading: SizedBox(height: 80, width: 80, child: CircleAvatar(backgroundImage:  NetworkImage(photoURL), )),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start,  children: [Text(username, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 22),), const Text("mini", style: TextStyle(fontSize: 20, color: Colors.grey))] ),
        trailing: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        ),
        
      ),
    );
  }
}