
class Message
{
  String sender;
  String receiver;
  DateTime timeStamp;
  String content;

  Message({required this.sender, required this.receiver, required this.content}) : timeStamp = DateTime.now();

}