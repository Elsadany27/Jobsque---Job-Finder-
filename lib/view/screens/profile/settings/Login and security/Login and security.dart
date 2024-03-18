import 'package:firbase/controller/ProfileController.dart';
import 'package:firbase/view/screens/profile/settings/Login%20and%20security/phone_number_settings.dart';
import 'package:firbase/view/screens/profile/settings/Login%20and%20security/verification/verification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/Custome_appbar_without_image.dart';
import 'ChangePassword.dart';
import 'EmailAdsress.dart';

class LoginAndSecurity extends StatelessWidget {
  const LoginAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        //appbar
        Custome_appbar_without_image(middle: "Login and security",icon: Icons.arrow_back,),SizedBox(height: 40,),

        //Accont access
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          padding:EdgeInsets.only(left: 10) ,
          height: 30,
          color: Colors.black12,
          child: Text("Accont access",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
        ),SizedBox(height: 20,),

        //content
        Consumer<ProfileController>(
  builder: (context, provider, child) {
  return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Email address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
            Container(
              height: 25,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                provider.emaill!=null?Text("${provider.emaill}"):Text("${provider.emailr}"),
                InkWell(onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmailAddressSetting(email:
                  "${provider.emaill!=null?Text("${provider.emaill}"):Text("${provider.emailr}")}"),));
                },child: Icon(Icons.arrow_forward))
              ]),
            )
          ],),
        );
  },
),Divider(thickness: 2,),

        //phone
        ListTile(title: Text("Phone number",style: TextStyle(fontWeight: FontWeight.bold)),trailing: IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhoneSetting(),));
        }),),Divider(thickness: 2,),//phone
      //Change password
        ListTile(title: Text("Change password",style: TextStyle(fontWeight: FontWeight.bold)),trailing: IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePasswordProfile(),));
        }),),Divider(thickness: 2,),
      //Two-step verification
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Two-step verification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              Container(
                height: 25,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Not Active"),
                      InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Verification(),));},child: Icon(Icons.arrow_forward))
                    ]),
              )
            ],),
        ),Divider(thickness: 2,),

        //Face ID
        ListTile(title: Text("Face ID",style: TextStyle(fontWeight: FontWeight.bold)),trailing: IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){}),),Divider(thickness: 2,),



      ],)),
    );
  }
}
