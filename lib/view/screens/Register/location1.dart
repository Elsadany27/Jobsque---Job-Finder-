import 'package:flutter/material.dart';

class Location1 extends StatelessWidget {
  const Location1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Location",style: TextStyle(fontSize:15 ,fontWeight: FontWeight.bold),),
      SizedBox(height: 25,),
      Text("Al Serag Mall, Entrance 4, Next to Tec Hub Store, Left corridor, Fifth Floor, Nasr City, Cairo, Egypt."),
    ],);
  }
}
