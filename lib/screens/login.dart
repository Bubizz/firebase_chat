import 'package:chat_app/screens/chats_list_page.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/services/auth.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


void _signIn() async
{
   await Auth().signInWithGoogle();
   Navigator.push(context, MaterialPageRoute(builder: (_) => ChatsPage()));
   Auth().addUserInBox();
}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SizedBox(
          width: 150,
          height: 30,
          child: ElevatedButton.icon(onPressed: () {
           _signIn();
          }, icon: const Icon(Icons.ac_unit_rounded), label: const Text("log in with Google")),
        ),
      ),
    );

  }
}




