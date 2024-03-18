import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../controller/ProfileController.dart';
import '../../../../controller/Register_login_controller.dart';
import '../../../widgets/custome_appbar.dart';
import '../../../widgets/custome_button.dart';
import '../../../widgets/custome_container_Register.dart';
import '../../../widgets/custome_textformfield.dart';
import '../../../widgets/custome_textformpass.dart';
import '../../provider/login_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sub_title.dart';
import '../../widgets/custom_title_text.dart';
import 'customLoginWidget/checkbox.dart';
import 'customLoginWidget/forget_pass.dart';
import 'customLoginWidget/icon_login.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});

  static String id="LoginPageid";
  TextEditingController usernamel=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  SizedBox size=SizedBox(height: 20,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<RegisterLogin>(
  builder: (context, provider, child) {
  return ListView(
          children: [
            //appbar
            Custome_appbar(image: "images/Logo.png",icon: Icons.arrow_back,middle: "",),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [IconLogin()],
            // ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomTitle(
                txt: 'Login',
              ),
            ),
           const SizedBox(
              height: 8,
            ),
            CustomSubTitle(txt: 'Please login to find  your dream job'),
            //first textfield => username
            CustomeTextformfield(ontap: (){},name: "Username",icon: Icon(Icons.person,color: Colors.black),controller:usernamel),
            SizedBox(height: 25,),
            //email
            CustomeTextformfield(ontap: (){},name: "Email",icon: Icon(Icons.email,color: Colors.black),controller: email),
            const SizedBox(height: 16,),
            //password
            CustomeTextPass(name: "Password",icon: Icon(Icons.visibility,color: Colors.black),controller: password,coloricon: Colors.black),
            //
            Row(
              children: [
                CustomCheckBox(),
                const Text("Remember Me"),
                const Spacer(),
                CustomLoginRegisterButton(
                  ontap: () {
                    Navigator.of(context).pushNamed("resetpassword");
                  },
                  str: 'Forgot Password?',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 84, top: 120),
              child: Row(
                children: [
                  const Text("Dont’t have an account? "),
                  CustomLoginRegisterButton(
                    str: 'Register',
                    ontap: () {
                      Navigator.of(context).pushNamed("register");
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            CustomeButton(ontap: ()async{
              //login firbase
              try {
                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }

              //others
              provider.Login(email.text, password.text,context);
              provider.usernamel=usernamel.text;
              provider.password=password.text;
              Provider.of<ProfileController>(context,listen: false).emaill=email.text;

            },fontsize: 15,textt: "Login",),
        size,
        Divider(thickness: 1,color: Colors.black,),
        size,
        //auth
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //google
            CustomeContainerRegister(image: "images/google.jpeg",textt: "Google"),
            //facebook
            CustomeContainerRegister(image: "images/facebook.jpeg",textt: "Facebook"),
          ],)
  ]);
  },
),
      ),
    );
  }
}

