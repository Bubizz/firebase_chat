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
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                        iconData: Icons.arrow_back_ios_new,
                        pressHandler: () {
                          Navigator.pop(context);
                        }),
                    const Spacer(),
                    Transform.translate(
                      offset: const Offset(-20, 70),
                      child: const Text(
                        "Settings",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer()
                  ]),
            ),
          ),
        ),
        Positioned(
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.elliptical(80, 60)),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(color: Colors.grey),
                ))
              ],
            ),
          ),
          top: 150,
          bottom: 0,
          left: 0,
          right: 0,
        )
      ]),
    );
  }
}
