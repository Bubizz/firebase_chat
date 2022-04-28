import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/chats_list_page.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User?>(context);
    return user == null ? const Login() : const ChatsPage();
  }
}
