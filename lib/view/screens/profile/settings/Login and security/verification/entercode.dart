import 'package:firbase/view/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../widgets/Custome_appbar_without_image.dart';

class EnterCode extends StatelessWidget {
  const EnterCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          //appbar
          Custome_appbar_without_image(middle: "Two-step verification",icon: Icons.arrow_back,),SizedBox(height: 40,),

          //text
          Text("Enter the 6 digit code",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text("Please confirm your account by entering the authorization code sen to your email",style: TextStyle(fontSize: 10),),SizedBox(height: 15,),

          //pincode

          PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.slide,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.red,
            ),
          ),SizedBox(height: 500,),

          //button
          CustomeButton(ontap: (){},textt: "Verify",)
          //
        ],),
      )),
    );
  }
}
