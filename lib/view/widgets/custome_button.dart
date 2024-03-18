import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
   CustomeButton({super.key,this.textt,required this.ontap,this.color,this.fontsize,this.icon});
  String? textt;
   final VoidCallback ontap;
   Color? color;
   double? fontsize;
   IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
    Expanded(
    child: ElevatedButton(
    onPressed: ontap,
    child: Text(textt!,style: TextStyle(fontSize: fontsize),),
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
    elevation: 20,
    shadowColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    fixedSize: Size(45, 50),
    ),
    )),
    ]);
  }
}

