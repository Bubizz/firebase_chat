import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/theme_button.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/themes_provider.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = "settings";

  @override
  State<SettingsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<SettingsPage> {

  bool _systemFont = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
        _topOfstack(context),
        Positioned.fill(
          top: 120,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.elliptical(55, 40)),
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    ExpansionTile(
                      children: [
                       ThemeButton(color: Colors.green, text: "Green"),
                        ThemeButton(color: Colors.orange, text: "Orange"),
                        ThemeButton(color: Colors.blue, text: "Blue"),
                        ThemeButton(color: Colors.grey, text: "Grey"),

                          
                      ],
                      title: const Text(
                        "Theme",
                     
                      ),
                      iconColor: Colors.red,
                      tilePadding: const EdgeInsets.all(0),
                    ),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Night mode",
                       
                        ),
                        CupertinoSwitch(
                          activeColor: Theme.of(context).primaryColorLight,
                            value:   Provider.of<Themes>(context, listen: true).isDark,
                            onChanged: (newValue) => setState(() {

                                  Provider.of<Themes>(context, listen: false).switchDarkMode();
                                  Provider.of<Themes>(context, listen: false).setDarkMode();
                                })),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _topOfstack(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
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
                  child: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Spacer()
              ]),
        ),
      ),
    );
  }
}
