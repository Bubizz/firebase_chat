import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, required this.iconData, required this.pressHandler}) : super(key: key);
  final IconData iconData;
  final VoidCallback pressHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(onPressed: pressHandler, icon: Icon(iconData)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 59, 33, 153),
        ));
  }
}
