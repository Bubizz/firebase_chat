import 'package:flutter/material.dart';

import '../widgets/custom_icon_button.dart';
import '../widgets/search_box.dart';


class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  static const routeName = "listOfMessages";

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {


  void _searchBoxHandler()
  {
  
  }

  void _navigateToSettings()
  {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: 
            [
              Container(
                alignment: Alignment.topCenter,
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconButton(iconData: Icons.list, pressHandler: _navigateToSettings),
                            
                              const Text("Messages",),
                            
                              CustomIconButton(iconData: Icons.search, pressHandler: _searchBoxHandler,)
                            ]),
                            const  Padding(padding: EdgeInsets.all(8.0), child: const SearchBox(),
                          ),
                          
                      ],
                    ),
                  ),
                )),
               

            ]
          ),
           
        ],
      ),
    );
  }
}
