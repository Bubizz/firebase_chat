import 'package:flutter/material.dart';
import 'package:chat_app/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("lib/background.png"),
            SizedBox(
              width: 150,
              height: 100,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Auth().signInWithGoogle();
                  },
                  icon: const Icon(FontAwesomeIcons.google),
                  label: const Text("Sign in with Google.")),
            ),
          ],
        ),
      ),
    );
  }
}
