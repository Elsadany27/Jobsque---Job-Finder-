import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
   CustomTitle({
    super.key,
  required this.txt,
   });
String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 39,
      child:  Text(
        txt,
        style:const TextStyle(
            fontFamily: "SFProDisplay",
            fontWeight: FontWeight.w500,
            fontSize: 28,
            letterSpacing: 1,
            color: Color(0XFF111827)),
      ),
    );
  }
}
