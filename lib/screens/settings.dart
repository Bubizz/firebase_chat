import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/custom_icon_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = "settings";

  @override
  State<SettingsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<SettingsPage> {
  bool nightMode = false;
  bool systemFont = false;

  var _fontSize = 16.0;



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
                      offset: const Offset(-20, 50),
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
        Positioned.fill(
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.elliptical(55, 40)),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    ExpansionTile(
                      title: Text(
                        "Theme",
                        style: TextStyle(color: Colors.black),
                      ),
                      children: [

                      ],
                      iconColor: Colors.red,
                      tilePadding: EdgeInsets.all(0),
                    ),
                    ExpansionTile(
                      children: [
                        ListTile(
                          title: const Text('16'),
                          leading: Radio<double>(
                            value: 16.0,
                            groupValue: _fontSize,
                            onChanged: (double? value) {
                              setState(() {
                                _fontSize = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('18'),
                          leading: Radio<double>(
                            value: 18.0,
                            groupValue: _fontSize,
                            onChanged: (double? value) {
                              setState(() {
                                _fontSize = value!;
                              });
                            },
                          ),
                        ),
                      ],
                      title: const Text(
                        "Font Size",
                        style: TextStyle(color: Colors.black),
                      ),
                      iconColor: Colors.red,
                      tilePadding: EdgeInsets.all(0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Night mode",
                          style: TextStyle(color: Colors.black),
                        ),
                        CupertinoSwitch(
                            value: nightMode,
                            onChanged: (newValue) => setState(() {
                                  nightMode = newValue;
                                })),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Use system font",
                          style: TextStyle(color: Colors.black),
                        ),
                        CupertinoSwitch(
                            value: systemFont,
                            onChanged: (newValue) => setState(() {
                                  systemFont = newValue;
                                })),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          top: 120,
        ),
      ]),
    );
  }
}
