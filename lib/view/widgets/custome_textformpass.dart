import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/Register_login_controller.dart';





class CustomeTextPass extends StatelessWidget {
  CustomeTextPass({super.key,this.name,this.icon,this.controller,this.color,this.coloricon,this.textcolor});

  TextEditingController? controller;
  String? name;
  Icon? icon;
  Color? color,coloricon,textcolor;

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterLogin>(
      builder: (context, provider, child) {
        return TextFormField(

          validator: (value) {
            if(value==null){
              return "field is null";
            }
            if(value.length<8){
              return "Password must be at least 8 characters";
            }

          },
          obscureText:provider.stste,
          style: TextStyle(color: textcolor),
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: color,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(width: 2, color: Colors.white60),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2, color:Color(0xFF1E1E1E) )
            ),
            prefixIcon: Icon(Icons.lock,color: coloricon,),
            hintText: name,
            hintStyle: TextStyle(color: textcolor),
            suffixIcon: InkWell(
                onTap: () => provider.ChangState(),
                child: icon),

          ),
        );
      },
    );;
  }
}
