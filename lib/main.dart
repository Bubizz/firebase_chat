import 'package:flutter/material.dart';
import 'screens/chats_list_page.dart';
import 'screens/settings.dart';
import 'screens/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(230, 6, 9, 59),
        listTileTheme: ListTileThemeData(iconColor: Colors.red,)
        
       
            
      ),

     initialRoute: ChatsPage.routeName,
     routes: 
     {
       ChatsPage.routeName : (_) => const ChatsPage(),
       SettingsPage.routeName : (_) => const SettingsPage(),
       Chat.routeName : (_) => const Chat()



     ,}

    );
  }
}

