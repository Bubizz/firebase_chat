import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themes_provider.dart';
import 'screens/chats_list_page.dart';
import 'screens/settings.dart';
import 'screens/chat.dart';

void main() {
  runApp(ChangeNotifierProvider( create: (context) => Themes(Colors.green, ),child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       initialRoute: ChatsPage.routeName,
       routes: 
       {
         ChatsPage.routeName : (_) => const ChatsPage(),
         SettingsPage.routeName : (_) => const SettingsPage(),
         Chat.routeName : (_) => const Chat()
    
    
    
       },
      theme: Provider.of<Themes>(context).customTheme
    );
    
  
  }
}

