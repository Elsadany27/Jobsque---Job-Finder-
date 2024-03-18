import 'package:firbase/chat/pages/register_pade.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/showsnakebar.dart';
import 'chatpage.dart';

//mostafa@gmail.com
//782002
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  static String id = "loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    kIconimage,
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " ابناء الشركه",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 75),
                  const Row(
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onchnaged: (data) {
                      email = data;
                    },
                    hinttext: "Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    obscure: true,
                    onchnaged: (data) {
                      password = data;
                    },
                    hinttext: "Password",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButtonn(
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            isloading = true;
                            setState(() {});
                            await loginUser();
                            Navigator.pushNamed(context, Chat.chat_id,
                                arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showsnakebar(
                                  context, 'No user found for that email');
                            } else if (e.code == 'wrong-password') {
                              showsnakebar(context,
                                  'Wrong password provided for that user');
                            }
                          } catch (e) {
                            showsnakebar(context, e.toString());
                          }
                          isloading = false;
                          setState(() {});
                        } else {}
                      },
                      txt: "Sign in"),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'don\'t have an acount?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            //navigator
                            // Navigator.push(context, MaterialPageRoute(builder: (context){
                            //   return RegsiterPage();
                            // }));

                            //Navigator(Named Routes)
                            Navigator.pushNamed(context, RegsiterPage.id);
                          },
                          child: const Text('  Register',
                              style: TextStyle(color: Color(0xffB0C1D4))))
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
