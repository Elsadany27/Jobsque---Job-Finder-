import 'package:flutter/material.dart';

import '../../widgets/custome_button.dart';

class SucessLgin extends StatelessWidget {
   SucessLgin({super.key});
SizedBox size =SizedBox(height: 30,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //arrow to back
              IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back,size: 30),),
size,
              //image
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.center,
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/Success Account Ilustration.png"),fit: BoxFit.fill)),),
              ),
              size,
              //Text
              Center(child: Text("Your account has been set up!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
              size,
              Center(child: Text("We have customized feeds according to your preferences",style: TextStyle(fontSize: 15),textAlign: TextAlign.center,)),
            size,size,size,
              CustomeButton(textt: "Get Started",ontap: (){
                Navigator.of(context).pushNamedAndRemoveUntil("mianhome",(route) => false,);
              },)
            ],
          ),
        ),
      ),
    );
  }
}
