
import 'package:firbase/view/Login/views/forget_password_view/pass_changet_succeefuly.dart';
import 'package:firbase/view/Login/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/Register_login_controller.dart';
import '../../../widgets/custome_appbar.dart';
import '../../../widgets/custome_button.dart';
import '../../../widgets/custome_textformpass.dart';
import '../../provider/login_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sub_text.dart';
import '../../widgets/custom_sub_title.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_title_text.dart';

class CreateNewPasswordPage extends StatelessWidget {
   CreateNewPasswordPage({super.key});

  static String id = "createnewpassword";
  TextEditingController password=TextEditingController();
  TextEditingController secondpassword=TextEditingController();

  GlobalKey<FormState> keyf=GlobalKey();
  GlobalKey<ScaffoldState> scaffoldkey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 60),
        child: Consumer<RegisterLogin>(
  builder: (context, provider, child) {
  return Form(
    key: keyf,
    child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Custome_appbarr(),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: CustomTitle(
                  txt: 'Create new password',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomSubTitle(
                  txt:
                      "Set your new password so you can login and acces Jobsque"),
              const SizedBox(
                height: 8,
              ),

              CustomeTextPass(name: "Password",controller: password,icon: Icon(Icons.visibility,color: Colors.black,),),
              const SizedBox(
                height: 24,
              ),
              CustomeTextPass(name: "Certain Password",controller: secondpassword,icon: Icon(Icons.visibility,color: Colors.black,),),

              const SizedBox(
                height: 15,
              ),
              CustomSubText(
                  txt: 'Both password must match',
                  color:const Color(0xff9CA3AF),
                  size: 16),
              const Spacer(
                flex: 9,
              ),
              // Container(
              //     width: double.infinity,
              //     child: CustomButton(
              //       onpressed: () {
              //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => PassChangedPage(),));
              //
              //       },
              //       txt: "Reset Password",
              //       color:const Color(0xff3366FF),
              //       txtColor: Colors.white,
              //     )),
              CustomeButton(ontap: (){
                keyf.currentState!.validate();
                //check password
                password.text==secondpassword.text&&password.text.length>=8?Container():
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password not match"),
                duration: Duration(seconds: 3),
                elevation: 25,));

                //change password
                provider.changepassword("${provider.username}", password.text,context);

              },textt: "Reset Password",fontsize: 15),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
  );
  },
),
      ),
    );
  }
}
