import 'package:chat_app/themes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageCard extends StatelessWidget {
  MessageCard({ Key? key, required this.message, required this.sentByApppUser }) : super(key: key);

  String message;
  bool sentByApppUser;

  @override
  Widget build(BuildContext context) {
    
      return Align(
        alignment: sentByApppUser ?  Alignment.centerRight : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 6/10,
          child: ClipPath(
            clipper: CustomClip(),
      
            child: Container(
              color: Provider.of<Themes>(context).colorPalette[300] ,
              
             child: Padding(
               padding: const EdgeInsets.all(18.0),
               child: Text(message, style: Theme.of(context).textTheme.bodyText1),
             )
            ),
          ),
        
          ),
      );
  }
}


class CustomClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path = Path();
    path.moveTo(size.width-10,0);
    path.lineTo(size.width-10.0, size.height/2 + 10);
    path.lineTo(size.width,size.height/2);
    path.lineTo(size.width-10,size.height/2 - 10);
    path.lineTo(size.width-10,size.height);
    path.lineTo(0,size.height);
    path.lineTo(0,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper clipper){
    return false;
  } 
}