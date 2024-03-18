import 'package:firbase/controller/ProfileController.dart';
import 'package:firbase/view/screens/profile/settings/Login%20and%20security/verification/getcode.dart';
import 'package:firbase/view/widgets/custome_button.dart';
import 'package:flutter/material.dart';


import '../../../../../widgets/Custome_appbar_without_image.dart';


class VerificationSecondPage extends StatefulWidget {
  VerificationSecondPage({super.key});

  @override
  State<VerificationSecondPage> createState() => _VerificationSecondPageState();
}

class _VerificationSecondPageState extends State<VerificationSecondPage> {
  bool switchh=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //appbar
            Custome_appbar_without_image(middle: "Two-step verification",icon: Icons.arrow_back,),SizedBox(height: 40,),

            //content
            //switch
            Container(
              margin: EdgeInsets.all(15),
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2),
              ),
              child:  ListTile(title: Text("Secure your account with two-step verification",style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Switch(
                  activeTrackColor: Colors.black,
                  activeColor: Colors.red,
                  value: switchh, onChanged: (value) {
                  setState(() {
                    switchh=value;
                  });
                },),),
            ),SizedBox(height: 20,),

            //select verification method
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Select a verification method",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1),
                ),
                child:ListTile(title: Text("Telephone number (SMS)",style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){}),)),SizedBox(height: 20,),

            //note
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Note : Turning this feature will sign you out anywhere you’re currently signed in. "
                  "We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.",
                  style: TextStyle(color: Color(0xff6B7280))),
            ),SizedBox(height: 320,),

            //button
            switchh==true?Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomeButton(ontap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetCodee(),));
              },textt: "Next",),
            ):Container()
          ]),),
    );
  }
}
