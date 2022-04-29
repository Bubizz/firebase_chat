import 'package:chat_app/models/ChatScreenArguments.dart';
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
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseDatabase.instance.setPersistenceEnabled(false);

  runApp(MultiProvider(child: const MyApp(), providers: [
    ChangeNotifierProvider<Themes>.value(value: Themes(Colors.green)),
   
    StreamProvider<User?>.value(
      initialData: null,
      value: Auth().getUser,
    )
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: "wrapper",
        routes: {
          ChatsPage.routeName: (_) => const ChatsPage(),
          SettingsPage.routeName: (_) => const SettingsPage(),
          "login": (_) => const Login(),
          "wrapper": (_) => const Wrapper()
        },
        theme: Provider.of<Themes>(context).customTheme,
        onGenerateRoute: (settings) {
          if (settings.name == Chat.routeName) {
            final args = settings.arguments as ChatScreenArguments;
            return MaterialPageRoute(builder: (context) {
              return Chat(
                args.username,
                args.imgURL,
              );
            });
          }
          return null;
        });
  }
}
