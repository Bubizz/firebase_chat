import 'package:flutter/cupertino.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({ Key? key }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoSearchTextField(
        backgroundColor: Color.fromARGB(226, 52, 28, 187),
      ),
    );
  }
}