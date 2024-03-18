import 'package:flutter/material.dart';

import '../../const/consts.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sub_text.dart';
import 'create_new_password_view.dart';

class ChechEmailPage extends StatelessWidget {
  const ChechEmailPage({super.key});

  static String id = "checkemail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 9,),
              Image.asset(
                'images/Email Ilustration.png',
                width: 132,
                height: 132,
              ),
              //   CustomText(txt: "Check your Email",),
              const Text(
                'Check your Email',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  fontFamily: kPrimaryfont,
                  color: Color(0xff111827),
                ),
              ),
            const  SizedBox(height: 12,),
              CustomSubText(txt:"We have sent a reset password to your email " ,color:const Color(0xff6B7280), size: 16),
          
             CustomSubText(txt: "address",color:const Color(0xff6B7280),size: 16, ),
            const  Spacer(flex: 9,),

              Container(
                  width: double.infinity,
                  child: CustomButton(onpressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewPasswordPage(),));
                  }, txt: "Open Email App",txtColor: Colors.white,color:const Color(0xff3366FF),)),
            const  Spacer(flex: 1,),

            ],
          ),
        ),
      ),
    );
  }
}
