import 'package:flutter/material.dart';

class CustomeColumn extends StatelessWidget {
   CustomeColumn({super.key, required this.ontap, this.icon,this.Textt});
   IconData? icon;
  String? Textt;
   final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: ontap,child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      Icon(icon),
      Text(Textt!),
    ]),);
  }
}
