

import '../constants.dart';

class Message{
  final String message;
  final String id;

  Message(this.message,this.id);


  
  factory Message.fromJsom(jsomData)
  {
    return Message(jsomData[KMessage],jsomData['id']);
  }
}

