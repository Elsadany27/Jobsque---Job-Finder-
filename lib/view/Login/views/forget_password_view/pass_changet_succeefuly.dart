import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_sub_text.dart';
import '../../widgets/custom_text.dart';

class PassChangedPage extends StatelessWidget {
  const PassChangedPage({super.key});

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
              const Spacer(
                flex: 9,
              ),
              Image.asset(
                'images/Email Ilustration.png',
                width: 137,
                height: 142,
              ),
              //   CustomText(txt: "Check your Email",),
              CustomText(txt: 'Password changed '),
              CustomText(txt: 'succesfully!'),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: 327,
                alignment: Alignment.center,
                child: CustomSubText(
                    txt:
                        "Your password has been changed successfully, we will let you know if there are more problems ",
                    color: const Color(0xff6B7280),
                    size: 16),
              ),
              CustomSubText(
                  txt:
                  "with your account",
                  color: const Color(0xff6B7280),
                  size: 16),

              const Spacer(
                flex: 9,
              ),

              Container(
                  width: double.infinity,
                  child: CustomButton(
                    onpressed: () {
                      Navigator.of(context).pushNamed("login");
                    },
                    txt: "Open Email App",
                    txtColor: Colors.white,
                    color: const Color(0xff3366FF),
                  )),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
