import 'package:flutter/material.dart';

import '../const/consts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hinttext,
      this.icon,
      this.prefixicon,
        this.suffixicon,
        this.controller,

      required this.obscure});

  String? hinttext;
  Icon? icon;
  Icon? prefixicon;
  IconButton? suffixicon;
  TextEditingController? controller;

  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        prefixIcon: prefixicon,
        icon: icon,
        hintText: hinttext,
        hintStyle: const TextStyle(
            color: Color(0xff9CA3AF),
            fontSize: 14,
            letterSpacing: 0.3,
            fontWeight: FontWeight.w400,
            fontFamily: kPrimaryfont),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffD1D5DB),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
