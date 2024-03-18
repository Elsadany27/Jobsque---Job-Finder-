import 'package:flutter/material.dart';

class Custome_appbar extends StatelessWidget {
   Custome_appbar({super.key,this.middle,this.image,this.icon,this.color});
  String? middle,image;
  IconData? icon;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(icon)),
        Text("${middle}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Image(image: AssetImage("${image}"),height:80 ,width: 100,color:color ,)
      ],);
  }
}
