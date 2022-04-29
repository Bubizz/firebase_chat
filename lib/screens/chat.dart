import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:chat_app/models/Message.dart';
import 'package:chat_app/services/sending_message.dart';
import '../services/auth.dart';
import '../widgets/custom_icon_button.dart';

import 'dart:math';

class Chat extends StatefulWidget {
  const Chat(this.username, this.imageURL);

  final String username;
  final String imageURL;

  static const routeName = "chat";

  @override
  State<Chat> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<Chat> {
  TextEditingController controller = TextEditingController();

  void _showErrorDialog() {
    final alert = CupertinoAlertDialog(
        title: const Text("Sending message failed"),
        content: const Text("Check your Internet connection and try again"),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _submitMessage() async {
    var text = controller.text;
    try {
      await ChatLogicHandler()
          .sendMessage(Message(
              sender: Auth().getCurrentUser!.displayName.toString(),
              receiver: widget.username,
              content: text))
          .timeout(const Duration(seconds: 2));
    } catch (e) {
      print("ww");
      _showErrorDialog();
    } finally {
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        middle: Text(
          widget.username,
          style:
              TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CustomIconButton(
            iconData: Icons.arrow_back_ios_new,
            pressHandler: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
        Container(
          alignment: Alignment.bottomCenter,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: EdgeInsets.all(
                min(90, MediaQuery.of(context).size.height * 0.15) * 0.4),
            child: Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color),
                      controller: controller,
                      onSubmitted: (_) => _submitMessage()),
                ),
                IconButton(
                    onPressed: _submitMessage, icon: const Icon(Icons.send))
              ],
            ),
          ),
        ),
        Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  bottom: Radius.elliptical(80, 60)),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).backgroundColor),
                  ))
                ],
              ),
            ),
            bottom: min(80, MediaQuery.of(context).size.height * 0.15))
      ]),
    );
  }
}
