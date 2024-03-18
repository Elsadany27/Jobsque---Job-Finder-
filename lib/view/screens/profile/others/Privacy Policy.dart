import 'package:flutter/material.dart';

import '../../../widgets/Custome_appbar_without_image.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          //appbar
          Custome_appbar_without_image(middle: "Privacy Policy",icon: Icons.arrow_back),

          //text one
          SizedBox(height: 35,),
          Text("Your privacy is important",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 10,),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
              " Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",style: TextStyle(fontSize: 15),),SizedBox(height: 15,),

              //text two
              SizedBox(height: 30,),
              Text("Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                  " Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. "),

              //last Text
              SizedBox(height: 50,),
              Text("Data controllers and contract partners",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 20,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                  " Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",style: TextStyle(fontSize: 15),),SizedBox(height: 15,),

            ]),
      ),),
    );
  }
}
