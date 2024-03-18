

import 'package:flutter/material.dart';

import '../../../widgets/Custome_appbar_without_image.dart';

class SavedNoData extends StatelessWidget {
  SavedNoData({super.key});

  SizedBox size = SizedBox(height: 20,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              size,
              //appbar
              Custome_appbar_without_image(icon: Icons.arrow_back,middle: "Saved"),
              //
              size,size,size,
              Container(
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/Saved Ilustration.png"),fit: BoxFit.contain)
                ),
              ),size,

              //text
              Text("Nothing has been saved yet",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 10,),
              Center(child: Text("Press the star icon on the job you want to save.",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),textAlign: TextAlign.center,)),


            ]),
      )
      ,
    );
  }
}
