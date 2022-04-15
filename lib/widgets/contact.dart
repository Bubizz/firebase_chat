import 'package:flutter/material.dart';
import '../screens/chat.dart';

class Contact extends StatelessWidget {
  const Contact({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Chat.routeName),
      child: ListTile(
        leading: const SizedBox(height: 80, width: 80, child: CircleAvatar(backgroundImage:  NetworkImage('https://images.unsplash.com/photo-1601288496920-b6154fe3626a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGVlbmFnZSUyMGdpcmx8ZW58MHx8MHx8&w=1000&q=80', ), )),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start,  children: const [Text("bebeb", style: TextStyle(fontSize: 22, ),), Text("mini", style: TextStyle(fontSize: 22, color: Colors.grey))] ),
        trailing: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        ),
        
      ),
    );
  }
}