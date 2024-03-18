import 'package:flutter/material.dart';
class CustomButtonn extends StatelessWidget {
   CustomButtonn({this.ontap,super.key,this.txt});
String? txt;
VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),

        child: Center(child: Text('$txt')),
      ),
    );
  }
}
