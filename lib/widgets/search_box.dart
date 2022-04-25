import 'dart:async';
import 'package:chat_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/cupertino.dart';
import '../services/user_searching.dart';
import 'package:provider/provider.dart';


class SearchBox extends StatefulWidget {
  const SearchBox({ Key? key, required this.focus}) : super(key: key);
  final FocusNode focus;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  var keyboardVisibilityController = KeyboardVisibilityController();
  final TextEditingController _textController = TextEditingController();
  late StreamSubscription<bool> keyboardSubscription ;

  @override void initState() {
 super.initState(); 
  keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) { 
    if(!visible)
    {
      widget.focus.unfocus();
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: _textController,
      style: TextStyle(color: Theme.of(context).primaryTextTheme.bodyMedium!.color,),
        focusNode: widget.focus,
        backgroundColor: CupertinoColors.systemGrey6,
        onSubmitted: (_) {
          widget.focus.unfocus();
         
          UserSearching().searchUser(_textController.value.toString());

          }
        
      
      
    );
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }
}