import 'package:flutter/material.dart';
import '../widgets/custom_icon_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = "settings";

  @override
  State<SettingsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<SettingsPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: 
                  FractionallySizedBox(
                    alignment: Alignment.topLeft,
                    widthFactor: 1/2,
                
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton(
                              iconData: Icons.list,
                              pressHandler: () {}),
                          const Text(
                            "Messages", style: TextStyle(color: Colors.white),
                          ),
                        
                        ]),
                  ),
             
            
            ),
          ),
        ),
        Positioned(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(color: Colors.grey),
                ))
              ],
            ),
          ),
          top: 180,
          bottom: 0,
          left: 0,
          right: 0,
        )
      ]),
    );
  }
}
