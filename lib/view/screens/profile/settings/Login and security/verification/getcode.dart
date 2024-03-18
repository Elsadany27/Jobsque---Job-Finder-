import 'package:firbase/controller/ProfileController.dart';
import 'package:firbase/controller/Register_login_controller.dart';
import 'package:firbase/view/widgets/custome_button.dart';
import 'package:firbase/view/widgets/custome_textformfield.dart';
import 'package:firbase/view/widgets/custome_textformpass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/Custome_appbar_without_image.dart';
import 'entercode.dart';

class GetCodee extends StatelessWidget {
   GetCodee({super.key});
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          //appbar
          Custome_appbar_without_image(middle: "Two-step verification",icon: Icons.arrow_back,),SizedBox(height: 40,),

          //content
          Text("Add Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text("We will send a verification code to this email",style: TextStyle(fontSize: 10),),SizedBox(height: 15,),

          //email to send otp
          CustomeTextformfield(ontap: (){},name: "Enter yor email",),SizedBox(height: 20,),
          //password
          Text("Enter your password",style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(height: 10,),
          CustomeTextPass(name: "Password",icon: Icon(Icons.visibility),controller: password,),

          //button
          SizedBox(height: 420,),
          CustomeButton(ontap: (){
            Provider.of<RegisterLogin>(context,listen: false).password==password.text?Container():
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3),content: Text("Password is not match")));

            //send code
          Provider.of<ProfileController>(context,listen: false).SendCode(email.text,context);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EnterCode(),));
          },textt: "Send code",)
          

        ],),
      )),
    );
  }
}
