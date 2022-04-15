import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/themes_provider.dart';

class ThemeButton extends StatelessWidget {
  ThemeButton({Key? key, required this.color, required this.text}) : super(key: key);
  MaterialColor color;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        color: color,
        height: 40,
        width: 70,
        child: TextButton(
            onPressed: () {
              Provider.of<Themes>(context, listen: false).setTheme(color);
            },
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  
            )),
      ),
    );
  }
}
