import 'package:chat_app/screens/auth_wrapper.dart';
import 'package:chat_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themes_provider.dart';
import 'screens/chats_list_page.dart';
import 'screens/settings.dart';
import 'screens/chat.dart';
import 'package:firebase_core/firebase_core.dart';
import './services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(child: MyApp(), providers: [
    ChangeNotifierProvider<Themes>.value(value: Themes(Colors.green)),
    StreamProvider<User?>(
      initialData: null,
      create: (context) => Auth().getUser,
    )
  ]));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
      return MaterialApp(
          title: 'Flutter Demo',
          home: const Wrapper(),
          routes: {
            ChatsPage.routeName: (_) => const ChatsPage(),
            SettingsPage.routeName: (_) => const SettingsPage(),
            Chat.routeName: (_) => const Chat(),
            "login": (_) => const Login()
          },
          theme: Provider.of<Themes>(context).customTheme,
         
          );
          
          
    
  }
}


/*
return StreamProvider<User?>(
        initialData: null,
        create: (context) => Auth().getUser,
        child: 
          */