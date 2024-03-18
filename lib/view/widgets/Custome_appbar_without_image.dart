import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Custome_appbar_without_image extends StatelessWidget {
  Custome_appbar_without_image({super.key,this.middle,this.icon,this.endicon});
  String? middle;
  IconData? icon;
  IconData? endicon;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(icon)),
        Text("${middle}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        IconButton(onPressed: (){
          GoogleSignIn googleSignIn=GoogleSignIn();
          googleSignIn.disconnect();
          Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
        },icon:Icon(endicon))
      ],);
  }
}
