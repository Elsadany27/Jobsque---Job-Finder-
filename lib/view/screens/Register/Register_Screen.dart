import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/ProfileController.dart';
import '../../../controller/Register_login_controller.dart';
import '../../../services/google.dart';
import '../../widgets/custome_appbar.dart';
import '../../widgets/custome_button.dart';
import '../../widgets/custome_container_Register.dart';
import '../../widgets/custome_textformfield.dart';
import '../../widgets/custome_textformpass.dart';


class Register extends StatelessWidget {
  Register({super.key});
  SizedBox size=SizedBox(height: 25,);
  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  GlobalKey<FormState> key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Consumer<RegisterLogin>(
  builder: (context, provider, child) {
  return Form(
    key: key,
    child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //appbar
                Custome_appbar(image: "images/Logo.png",icon: Icons.arrow_back,middle: "",),
                size,
                size,
                Text("Create Account",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Text("Please create an account to find your dream job",style: TextStyle(fontSize: 15),),
                  size,size,
                  //username
                  CustomeTextformfield(name: "Username",icon: Icon(Icons.person,color: Colors.black,),controller:username ,ontap: ()async{
                  }),
                  size,
                  //email
                  CustomeTextformfield(name: "Email",icon: Icon(Icons.email,color: Colors.black,),controller:email ,),
                  size,
                  //password
                  CustomeTextPass(name: "Password",controller: password,icon: Icon(Icons.visibility,color: Colors.black,),),
                  size,size,size,size,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Already have an account?",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushNamed("login");
                    }, child:Text("Login",style: TextStyle(fontWeight: FontWeight.w700),))
                  ],),

                  //button
                  CustomeButton(textt: "Create Account",ontap: ()async{
                    try {
                      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      Navigator.of(context).pushNamed("secondregister");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }

                    //send data
                    provider.senddata(username.text, email.text, password.text,context);
                    // provider.chexkname(username.text);
                    provider.username=username.text;
                    Provider.of<ProfileController>(context,listen: false).emailr=email.text;
                    //validation
                    key.currentState!.validate();
                    provider.password=password.text;
                    // Navigator.of(context).pushNamed("secondregister");
                  }),
                  size,
                  Divider(thickness: 1,color: Colors.black,),
                  size,
                  //auth
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     //google
                     InkWell(
                         onTap: (){
                           Provider.of<Services>(context,listen: false).signInWithGoogle(context);
                         },
                         child: CustomeContainerRegister(image: "images/google.jpeg",textt: "Google")),

                   //facebook
                     CustomeContainerRegister(image: "images/facebook.jpeg",textt: "Facebook"),
                 ],)
              ],),
  );
  },
),
          ),
        ),
      ),
    );
  }
}
