import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  MessageCard({ Key? key, required this.message }) : super(key: key);

  String message;

  @override
  Widget build(BuildContext context) {
    
      return FractionallySizedBox(
        widthFactor: 4/10,
        child: ClipPath(
          clipper: CustomClip(),

          child: Container(
            color: Colors.yellow,
            
           child: Padding(
             padding: const EdgeInsets.all(18.0),
             child: Text(message, style: TextStyle(color: Colors.red),),
           )
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