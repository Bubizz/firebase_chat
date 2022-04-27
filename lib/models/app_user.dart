
import 'package:flutter/material.dart';

class AppUser
{
  final String name;
  final String ImgURL;
  final Map<String, dynamic>? messagesSent;

  AppUser(this.name, this.ImgURL,this.messagesSent);

  factory AppUser.fromJson(Map<String, dynamic> map)
  {
   var a = AppUser(map["username"], map["photoURL"], map["inbox"] );
   print(a.toString() +"vvfvfvf");
    return a;
  }


}