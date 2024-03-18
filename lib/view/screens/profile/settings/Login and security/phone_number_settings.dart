import 'package:firbase/view/widgets/custome_listtile_with_switch.dart';
import 'package:firbase/view/widgets/custome_textformfield.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/Custome_appbar_without_image.dart';
import '../../../../widgets/custome_button.dart';
import 'Login and security.dart';

class PhoneSetting extends StatelessWidget {
  const PhoneSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          //appbar
          Custome_appbar_without_image(middle: "Phone number",icon: Icons.arrow_back,),SizedBox(height: 40,),

          //content
          Text("Main phone number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),SizedBox(height: 15,),
          CustomeTextformfield(name: "Phone Number"),SizedBox(height: 10,),

          CustomeListTileSwitch(title: "Use the phone number to reset your password",),
          SizedBox(height: 490,),

          CustomeButton(ontap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginAndSecurity()));
          },textt: "Save",)
        ],),
      )),
    );
  }
}
