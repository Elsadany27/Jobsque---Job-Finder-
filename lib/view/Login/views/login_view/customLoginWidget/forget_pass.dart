import 'package:flutter/material.dart';

import '../../../const/consts.dart';

class CustomLoginRegisterButton extends StatelessWidget {
  CustomLoginRegisterButton({super.key, required this.str, required this.ontap});

  Function() ontap;
  String str;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Text(
        str,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: kPrimaryfont,
          letterSpacing: 0.1,
          color: Color(0xff3366FF),
        ),
      ),
    );
  }
}
