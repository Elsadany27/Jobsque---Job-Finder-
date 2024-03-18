import 'package:flutter/material.dart';

import '../const/consts.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onpressed, required this.txt,this.color,this.txtColor});

  Function() onpressed;
  String txt;
  Color? color;
Color? txtColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: onpressed,
      color: color,
      splashColor:const Color(0xff3366FF),
      child: Text(
        txt,
        style: TextStyle(
          color: txtColor,
          fontFamily: kPrimaryfont,
          fontSize: 16,
          letterSpacing: 1
        ),
      ),
    );
  }
}
