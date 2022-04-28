import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/cupertino.dart';


class SearchBox extends StatefulWidget {
  const SearchBox({ Key? key, required this.focus, required this.searchHandler}) : super(key: key);
  final FocusNode focus;
  final Function searchHandler;

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
      style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
        focusNode: widget.focus,
        backgroundColor: CupertinoColors.systemGrey6,
        onSubmitted: (text) => widget.searchHandler(text)
        
      
      
    );
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }
}