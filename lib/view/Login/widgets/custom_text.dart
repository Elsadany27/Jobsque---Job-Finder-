
import 'package:flutter/material.dart';

import '../const/consts.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.txt,
  });

  String txt;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style:const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        fontFamily: kPrimaryfont,
        color: Color(0xff111827),
      ),
    );
  }
}
