import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/chats_list_page.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  Consumer<User?>(
      builder: (context, value, child)
    {
      if(value==null)
      {
       return  const Login();

      }
      else
      {
        return const ChatsPage();
      }
      }
   );
  }
}