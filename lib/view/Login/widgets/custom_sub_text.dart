
import 'package:flutter/material.dart';

import '../const/consts.dart';

class CustomSubText extends StatelessWidget {
  CustomSubText({
    required this.txt,
    this.size,
    this.color,
    super.key,
  });

  String txt;
  double? size;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(txt,
        style: TextStyle(
          fontFamily: kPrimaryfont,
          fontSize: size,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
          color: color,
        ));
  }
}
