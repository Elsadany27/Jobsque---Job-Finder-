import 'package:firbase/view/widgets/custome_button.dart';
import 'package:firbase/view/widgets/custome_listTile.dart';
import 'package:firbase/view/widgets/custome_listtile_with_switch.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/Custome_appbar_without_image.dart';
import 'VerificationSecondPage.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child:Column(children: [
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
        child: CustomeListTileSwitch(title: "Secure your account with two-step verification"),
      ),
      
      //text
      CustomeListTile(ontap: (){},icon: Icons.lock,
        title: "Two-step verification provides additional security by asking for a verification code every time you log in on another device.",),
     SizedBox(height: 25,),
      CustomeListTile(ontap: (){},icon: Icons.book,
        title: "Adding a phone number or using an authenticator will help keep your account safe from harm.",),

      //button
      SizedBox(height: 350,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomeButton(ontap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerificationSecondPage(),));
        },textt: "Next",),
      )
    ]),),);
  }
}
