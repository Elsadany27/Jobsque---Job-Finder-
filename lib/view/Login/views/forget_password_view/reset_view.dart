import 'package:flutter/material.dart';


import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sub_title.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_title_text.dart';
import '../login_view/customLoginWidget/forget_pass.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
static String id= "resetpassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding:const EdgeInsets.only(top: 60, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Custome_appbarr(),
          Padding(
              padding: const EdgeInsets.only(top: 60),
              child: CustomTitle(
                txt: "Reset Password",
              )),
          const SizedBox(
            height: 8,
          ),
          CustomSubTitle(
            txt:
                'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
          ),
          const SizedBox(
            height: 35,
          ),
          CustomTextField(
            obscure: false,
            prefixicon: const Icon(Icons.mail_outlined, size: 20),
            hinttext: "Enter your email",
          ),
       const   Spacer(flex: 9,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You remember your password',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9CA3AF),
                ),
              ),
              const SizedBox(
                width: 6,
              ),

              CustomLoginRegisterButton(str: "Login", ontap: () {
                Navigator.pop(context);
              })
            ],
          ),
          const Spacer(flex: 1,),
          Container(
            width: double.infinity,
            child: CustomButton(
              txtColor: Colors.white,
              txt: 'Request password reset',
              onpressed: () {
                Navigator.of(context).pushNamed("checkmail");
              },
              color:const Color(0xff3366FF),
            ),
          ),
          const Spacer(flex: 1,),

        ],
      ),
    ));
  }
}
