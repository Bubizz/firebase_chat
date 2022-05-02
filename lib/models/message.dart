
class Message
{
  String sender;
  String receiver;
  DateTime? timeStamp;
  String content;

  Message({required this.sender, required this.receiver, required this.content, DateTime? timeStamp } ) : this.timeStamp = timeStamp ?? DateTime.now() ;

  factory
  Message.fromJSON(Map<String,dynamic> message, String receiver, String sender)
 {
  
  return Message(content: message["content"], timeStamp: DateTime.parse(message["timestamp"]), sender: sender, receiver: receiver );
 }

}