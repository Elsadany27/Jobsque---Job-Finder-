import 'package:firbase/view/widgets/custome_button.dart';
import 'package:flutter/material.dart';

class Sucess extends StatelessWidget {
  const Sucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Your data has been\n successfully sent",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              Text("You will get a message from our team, about \nthe announcement of employee acceptance",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
              SizedBox(height: 25,),
              CustomeButton(ontap: (){
                Navigator.of(context).pushNamedAndRemoveUntil("mianhome", (route) => false);
              },textt: "Back To Home",)

          ],),
        ),
      ),
    );
  }
}
