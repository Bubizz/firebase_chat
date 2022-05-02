import 'package:chat_app/widgets/message.dart';
import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/services/chat_logic.dart';
import 'package:provider/provider.dart';
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


  var isSendingButtonEnabled = true;

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

  void _submitMessage(Function(Message m) reflectMessageOnTheScreen) async {
    var text = controller.text;
    if(text == "")
    {
      return;
    }
    controller.clear();
    setState(() {
      isSendingButtonEnabled = false;
    });
    try {
      var m = Message(
              sender: Auth().getCurrentUser!.displayName.toString(),
              receiver: widget.username,
              content: text);
      await ChatLogicHandler().sendMessage(m).timeout(const Duration(seconds: 2));
      reflectMessageOnTheScreen(m);
         
    
    } catch (e) {
      _showErrorDialog();
    } 
    finally
    {
      isSendingButtonEnabled = true;
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
      body: 
      ChangeNotifierProvider<ChatProvider>(
        create: (context) => ChatProvider(widget.username),
        child: Consumer<ChatProvider>(
         builder: (context, value, child) {
          return
          Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
           Container(
             alignment: Alignment.bottomCenter,
             color: Theme.of(context).primaryColor,
             child: Padding(
               padding: EdgeInsets.only(bottom: min(22, MediaQuery.of(context).size.height* 0.04,), left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1),
               child: Row(
                 children: [
                   Expanded(
                     child: CupertinoTextField(
                       placeholder: "Type something",
                         style: TextStyle(
                             color: Theme.of(context).textTheme.bodyMedium!.color),
                         controller: controller,),
                         
                   ),
                   IconButton(
                       onPressed: isSendingButtonEnabled ? () => _submitMessage(value.addMessage) : null, icon: const Icon(Icons.send))
                 ],
               ),
             ),
           ),
           Positioned.fill(
               child: ClipRRect(
                 borderRadius: const BorderRadius.vertical(
                     bottom: Radius.elliptical(80, 60)),
                 child: Container(
                   color: Theme.of(context).backgroundColor,
                   child: Padding(
                     padding: const EdgeInsets.only(bottom: 20.0),
                     child: ListView.builder(
                       reverse: true,
                       itemBuilder: (_, index) {
                       
                       return Column(
                         children: [
                           MessageCard(message: value.messages[index].content, sentByApppUser: value.messages[index].sender == Auth().getCurrentUser!.displayName.toString(),),
                           const SizedBox(height: 20,)
                         ],
                       );
                     },
                     itemCount: value.messages.length,),
                   ),
                 )
                 
               ),
               bottom: min(80, MediaQuery.of(context).size.height * 0.15))
                ]);
         }),
      ),
    );
  }
}

class ChatProvider extends ChangeNotifier
{
  var messages = <Message>[];

  ChatProvider(String usernameInbox)
  {
    ChatLogicHandler().getStreamReadingMessages(usernameInbox).skip(1).listen((event) {if(event!=null){addMessage(event);} });
    ChatLogicHandler().loadMessages(usernameInbox).then((value)  { messages.insertAll(0, value); notifyListeners(); });


    
  }

  void addMessage(Message message)
  {
    messages.insert(0, message);
    notifyListeners();
  }



}


