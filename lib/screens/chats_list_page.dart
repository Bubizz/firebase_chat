import 'package:flutter/material.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/search_box.dart';
import '../screens/settings.dart';
import '../widgets/contact.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  static const routeName = "listOfMessages";

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  late final searchFocus = FocusNode();

  void _searchBoxHandler() {
    searchFocus.requestFocus();
  }

  void _navigateToSettings() {
      Navigator.of(context).pushNamed(SettingsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                            iconData: Icons.list,
                            pressHandler: _navigateToSettings),
                        Text(
                          "Messages", style: Theme.of(context).textTheme.titleLarge
                        ),
                        CustomIconButton(
                          iconData: Icons.search,
                          pressHandler: _searchBoxHandler,
                        )
                      ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SearchBox(
                      focus: searchFocus,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
 
        Positioned(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(60)),
            child: Container(color: Theme.of(context).backgroundColor,
            child: ListView.builder(

              itemCount: 10,
              itemBuilder: (_, index) => Column(
                children: const [
                  Contact(),
                  SizedBox(height: 10,)
                ],
              )),
            )
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
