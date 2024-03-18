
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/message.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    //becouse the listview make the container have the width of the scaffold
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(

        margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        padding:const EdgeInsets.only(left: 16,right: 32,top: 32,bottom: 32),
        decoration:const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),

            )),
        child: Text(message.message,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}


class ChatBubleuser extends StatelessWidget {
  const ChatBubleuser({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(

        margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        padding:const EdgeInsets.only(left: 16,right: 32,top: 32,bottom: 32),
        decoration:const BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            )),
        child: Text(message.message,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
