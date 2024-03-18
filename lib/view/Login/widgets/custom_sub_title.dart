import 'package:flutter/material.dart';

class CustomSubTitle extends StatelessWidget {
  CustomSubTitle({
    required this.txt,
    super.key,
  });

  String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 63,
      child: Text(
        txt,
        style: const TextStyle(
            color: Color(0xff6B7280),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            letterSpacing: 0.1),
      ),
    );
  }
}
