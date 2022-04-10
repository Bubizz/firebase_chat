import 'dart:async';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/cupertino.dart';


class SearchBox extends StatefulWidget {
  const SearchBox({ Key? key, required this.focus}) : super(key: key);
  final FocusNode focus;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  var keyboardVisibilityController = KeyboardVisibilityController();
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
        focusNode: widget.focus,
        backgroundColor: CupertinoColors.systemGrey6,
        onSubmitted: (_) {widget.focus.unfocus();},
      
      
    );
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }
}