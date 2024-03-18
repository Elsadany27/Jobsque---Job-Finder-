import 'package:flutter/material.dart';

import '../../../widgets/Custome_appbar_without_image.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          //appbar
          Custome_appbar_without_image(middle: "Terms & Conditions",icon: Icons.arrow_back),

          //text one
          SizedBox(height: 30,),
          Text("Lorem ipsum dolor",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 15,),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra."
              " Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra."
              " Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",style: TextStyle(fontSize: 15),),SizedBox(height: 45,),

          //text two
          Text("Lorem ipsum dolor",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 10,),
          Text("Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",style: TextStyle(fontSize: 12),),SizedBox(height: 20,),

          //container
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 150,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 1),color: Color(0xffF4F4F5)),
            child: Text("Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. "),
          ),
          
          //last text
          SizedBox(height: 20,),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ")
        ]),
      ),),
    );
  }
}
