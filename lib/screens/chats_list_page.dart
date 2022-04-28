import 'package:chat_app/models/app_user.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/user_searching.dart';
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

  var displayedContacts = <AppUser>[];


  void _searchBoxHandler() {
    searchFocus.requestFocus();
  }

  void _navigateToSettings() {
    Navigator.of(context).pushNamed(SettingsPage.routeName);
  }

  Future<List<AppUser>?> _searchUsers(String name) async
  {
    displayedContacts = await UserSearching().searchUser(name);

    setState(() {
      
    });
    return null;
    
  }

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
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: _navigateToSettings,
                          child: CircleAvatar(
                              child: Image.network(Auth().getCurrentUser!.photoURL!),
                          ),  
                        ),
                        Text("Messages",
                            style: Theme.of(context).textTheme.titleLarge),
                        CustomIconButton(
                          iconData: Icons.search,
                          pressHandler: _searchBoxHandler,
                        )
                      ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SearchBox(
                      focus: searchFocus,
                      searchHandler: _searchUsers
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(60)),
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: ListView.builder(
                    itemCount: displayedContacts.length,
                    itemBuilder: (_, index) => Column(
                          children: [
                            Contact(photoURL: displayedContacts[index].ImgURL, username: displayedContacts[index].name , ),
                            const SizedBox(
                              height: 10,
                              
                            )
                          ],
                        )),
              )),
          top: 180,
          bottom: 0,
          left: 0,
          right: 0,
        )
      ]),
    );
  }
}
