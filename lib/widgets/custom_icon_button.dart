import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, required this.iconData, required this.pressHandler}) : super(key: key);
  final IconData iconData;
  final VoidCallback pressHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        child: IconButton(
          iconSize: 22,
          onPressed: pressHandler, icon: Icon(iconData)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).buttonColor
        ));
  }
}
