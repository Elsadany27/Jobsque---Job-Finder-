import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/showsnakebar.dart';
import 'chatpage.dart';

class RegsiterPage extends StatefulWidget {
  RegsiterPage({super.key});

//use to navigation
  static String id = 'RegsiterPage';

  @override
  State<RegsiterPage> createState() => _RegsiterPageState();
}

class _RegsiterPageState extends State<RegsiterPage> {
  // to registeration
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isloading = false;

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
                  SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    kIconimage,
                    height: 100,
                  ),
                  Row(
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
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onchnaged: (data) {
                      email = data;
                    },
                    hinttext: "Email",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    onchnaged: (data) {
                      password = data;
                    },
                    hinttext: "Password",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButtonn(
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            isloading = true;
                            setState(() {});
                            await registerUser();

                            Navigator.pushNamed(context, Chat.chat_id,arguments: email);
                            showsnakebar(context, 'success');

                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showsnakebar(context, 'weak password');
                            } else if (e.code == 'email-already-in-use') {
                              showsnakebar(context,
                                  'The account already exists for that email');
                            }
                          } catch (e) {
                            showsnakebar(context, 'there was an error');
                          }
                          isloading = false;
                          setState(() {});
                        } else {}
                      },
                      txt: "Register"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text('  login',
                              style: TextStyle(color: Color(0xffB0C1D4))))
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> registerUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
