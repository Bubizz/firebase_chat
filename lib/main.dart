import 'package:chat_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themes_provider.dart';
import 'screens/chats_list_page.dart';
import 'screens/settings.dart';
import 'screens/chat.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider( create: (context) => Themes(Colors.green ),child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       initialRoute: "login",
       routes: 
       {
         ChatsPage.routeName : (_) => const ChatsPage(),
         SettingsPage.routeName : (_) => const SettingsPage(),
         Chat.routeName : (_) => const Chat(),
         "login" : (_) => const Login()
    
    
    
       },
      theme: Provider.of<Themes>(context).customTheme
    );
    
  
  }
}

