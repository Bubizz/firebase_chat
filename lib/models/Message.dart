
class Message
{
  String sender;
  String receiver;
  DateTime timeStamp = DateTime.now();
  String content;

  Message({required this.sender, required this.receiver, required this.content, timeStamp } );

  factory
  Message.fromJSON(Map<String,dynamic> message, String receiver, String sender)
 {
   print("uwuwuuu");
   print(message);
   print(sender);
   print(receiver);
  return Message(content: message["content"], timeStamp: message["timestamp"], sender: sender, receiver: receiver );
 }

}