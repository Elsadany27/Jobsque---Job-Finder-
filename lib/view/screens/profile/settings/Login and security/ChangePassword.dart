import 'package:firbase/view/screens/profile/settings/Login%20and%20security/Login%20and%20security.dart';
import 'package:firbase/view/widgets/custome_button.dart';
import 'package:firbase/view/widgets/custome_textformfield.dart';
import 'package:firbase/view/widgets/custome_textformpass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controller/Register_login_controller.dart';
import '../../../../widgets/Custome_appbar_without_image.dart';

class ChangePasswordProfile extends StatelessWidget {
   ChangePasswordProfile({super.key});
  TextEditingController newpassword=TextEditingController();
  TextEditingController confirmpassword=TextEditingController();

   GlobalKey<FormState> keyprofile=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: keyprofile,
          child: ListView(children: [
            //appbar
            Custome_appbar_without_image(middle: "Change password",icon: Icons.arrow_back,),SizedBox(height: 50,),

            //content
            Text("Enter your old password",style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(height: 10,),
            CustomeTextPass(name: "Enter old password",icon: Icon(Icons.visibility),coloricon: Colors.black,),
            SizedBox(height: 30,),
            Text("Enter your new password",style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(height: 10,),
            CustomeTextPass(name: "Enter new password",icon: Icon(Icons.visibility),coloricon: Colors.black,controller: newpassword,),
            SizedBox(height: 30,),
            Text("Confirm your new password",style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(height: 10,),
            CustomeTextPass(name: "confirm password",icon: Icon(Icons.visibility),coloricon: Colors.black,controller: confirmpassword,),

            //button
            SizedBox(height: 320,),
            Consumer<RegisterLogin>(
  builder: (context, provider, child) {
  return CustomeButton(ontap: (){
              keyprofile.currentState!.validate();
              //check password
              newpassword.text==confirmpassword.text&&newpassword.text.length>=8?Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>LoginAndSecurity(),)):
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password not match"),
                duration: Duration(seconds: 3),
                elevation: 25,));

              //change password
              provider.changepassword("${provider.username}", newpassword.text,context);
            },textt: "save",fontsize: 15,);
  },
)

          ],),
        ),
      ),),
    );
  }
}
