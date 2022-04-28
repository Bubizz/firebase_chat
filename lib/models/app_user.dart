

class AppUser
{
  final String name;
  final String ImgURL;
  final Map<String, dynamic>? messagesSent;

  AppUser(this.name, this.ImgURL,this.messagesSent);

  factory AppUser.fromJson(Map<String, dynamic> map)
  {
   return AppUser(map["username"], map["photoURL"],  map["inbox"] == null ? null : Map<String,dynamic>.from(map["inbox"] as Map<dynamic, dynamic>) );
 
    
  }


}