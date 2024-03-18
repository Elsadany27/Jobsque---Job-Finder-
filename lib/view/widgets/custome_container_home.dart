import 'package:flutter/material.dart';

class CustomeContainer extends StatelessWidget {
   CustomeContainer({super.key,this.textt,this.color});
  String? textt;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      width: 80,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Text("$textt",style: TextStyle(color: color,fontSize: 12),),
    );  }
}
