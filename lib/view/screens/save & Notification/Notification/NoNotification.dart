
import 'package:flutter/material.dart';

import '../../../widgets/Custome_appbar_without_image.dart';

class NoNotification extends StatelessWidget {
  NoNotification({super.key});

  SizedBox size = SizedBox(height: 20,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              size,
              //appbar
              Custome_appbar_without_image(icon: Icons.arrow_back,middle: "Notification"),
              //
              size,size,size,
              Container(
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/Notification Ilustration.png"),fit: BoxFit.contain)
                ),
              ),size,

              //text
              Text("No new notifications yet",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 10,),
              Center(child: Text("You will receive a notification if there is\n something on your account",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),textAlign: TextAlign.center,)),

            ]),
      )
      ,
    );
  }
}
