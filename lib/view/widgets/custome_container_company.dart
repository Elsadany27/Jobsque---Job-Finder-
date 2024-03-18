import 'package:flutter/material.dart';

class CustomeContainerCompany extends StatelessWidget {
   CustomeContainerCompany({super.key,this.text1,this.text2});
    String? text1,text2;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 180,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          border: Border.symmetric(
              vertical: BorderSide(width: 1,color: Colors.grey) ,
              horizontal: BorderSide(width:1,color: Colors.grey))
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${text1}",style: TextStyle(fontSize: 11),),
            SizedBox(height: 10,),
            Text("${text2}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
          ],),
      ),
    );;
  }
}
