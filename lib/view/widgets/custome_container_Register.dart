import 'package:flutter/material.dart' ;

class CustomeContainerRegister extends StatelessWidget {
   CustomeContainerRegister({super.key,this.textt,this.image});
  String? image,textt;
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(width: 1,color: Colors.grey) ,
              horizontal: BorderSide(width:1,color: Colors.grey))
      ),
      child: Row(
        children: [
          Image(image: AssetImage("${image}"),height: 25,width: 50,),
          Text("${textt}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
        ],),
    );
  }
}
