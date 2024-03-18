import 'package:flutter/material.dart';

class CustomeTextformfield extends StatelessWidget {
  CustomeTextformfield(
      {super.key, this.name, this.icon, this.controller, this.label,this.color,this.sIcon,this.textcolor, this.ontap});

  String? name, label;
  Icon? icon;
  Icon? sIcon;
  TextEditingController? controller;
  Color? color,textcolor;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: textcolor),
      controller: controller,
      onEditingComplete:ontap ,
      validator: (value) {
        if(value!.isEmpty){
          return "The field is empty";
        }
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: color,
          suffixIcon: sIcon,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: BorderSide(width: 2,color: Colors.cyanAccent),
          // ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 2, color: Colors.white60),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2, color: Color(0xFF1E1E1E))),
          // disabledBorder:OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: BorderSide(width: 2,color: Colors.
          //   redAccent),
          // ) ,
          prefixIcon: icon,
          hintText: name,
          hintStyle: TextStyle(color: textcolor),
          labelText: label,
          labelStyle: TextStyle(color: textcolor)),
    );
  }
}
