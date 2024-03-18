import 'package:firbase/controller/ProfileController.dart';
import 'package:firbase/view/screens/profile/settings/Login%20and%20security/Login%20and%20security.dart';
import 'package:firbase/view/screens/profile/settings/language.dart';
import 'package:firbase/view/screens/profile/settings/notification.dart';
import 'package:firbase/view/screens/profile/settings/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/Register_login_controller.dart';
import '../../widgets/Custome_appbar_without_image.dart';
import '../../widgets/custome_listTile.dart';
import 'others/Help Center.dart';
import 'others/Privacy Policy.dart';
import 'others/Terms & Conditions.dart';
import 'settings/EditProfile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key,this.username,this.bio,this.about});
  String? username,bio,about;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Stack(
          children: [
            Container(
              height: 800,color:Color(0xffD6E4FF),
            ),

            //content page
            Positioned(
              top: 150,
              width: 400,
              child: Container(
                height: 800,
                color: Colors.white,
                child: Column(children: [
                  SizedBox(height: 50,),
                  //Text
                  username!=null?
                  Center(child: Text("$username",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))):Provider.of<RegisterLogin>(context,listen: false).username!=null?
                  Text("Hi ,${Provider.of<RegisterLogin>(context,listen: false).username}👋",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),):
                  Text("Hi ,${Provider.of<RegisterLogin>(context,listen: false).usernamel}👋",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                  bio!=null?Center(child: Text("$bio",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300))):Text(""),

                  //container for number of applied job and review
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(15),
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Text("Applied",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                          SizedBox(height: 7,),
                          Text("46",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                        ],),
                        Column(children: [
                          Text("Reviewed",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                          SizedBox(height: 7,),
                          Text("23",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                        ],),
                        Column(children: [
                          Text("Contacted",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                          SizedBox(height: 7,),
                          Text("16",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                        ],),
                      ],),
                  ),

                  //about
                  Container(
                    height: 420,
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("About",style: TextStyle(fontSize: 15,color: Color(0xff6B7280))),
                            TextButton(child: Text("Edit"),onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile(),));
                            }),
                          ],),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(left: 5,right: 10),
                          child:
                          about!=null?Text("${about}"):Text("For Example: I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.")),

                      //general settongs
                      Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        padding:EdgeInsets.only(left: 10) ,
                        height: 30,
                        color: Colors.black12,
                        child: Text("General",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                      ),

                      CustomeListTile(title: "Edit Profile",icon: Icons.person,ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile(),));
                      },arrowicon: Icons.arrow_forward),Divider(thickness: 2,),
                      CustomeListTile(title: "Portfolio",icon: Icons.folder_special_rounded,ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PortfolioProfile(),));
                      },arrowicon: Icons.arrow_forward),Divider(thickness: 2,),
                      CustomeListTile(title: "Langauge",icon: Icons.language,ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LanguagePage(),));
                      },arrowicon: Icons.arrow_forward),Divider(thickness: 2,),
                      CustomeListTile(title: "Notification",icon: Icons.notifications,ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationSettings(),));
                      },arrowicon: Icons.arrow_forward),Divider(thickness: 2,),
                      CustomeListTile(title: "Login and security",icon: Icons.lock,ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginAndSecurity(),));
                      },arrowicon: Icons.arrow_forward),

                      //other settings
                      Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        padding:EdgeInsets.only(left: 10) ,
                        height: 30,
                        color: Colors.black12,
                        child: Text("Others",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                      ),
                      ListTile(title: Text("Accesibility",style: TextStyle(fontWeight: FontWeight.bold)),trailing: IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){}),),Divider(thickness: 2,),
                      ListTile(title: Text("Help Center",style: TextStyle(fontWeight: FontWeight.bold)),trailing: IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpCenter(),));
                      }),),Divider(thickness: 2,),
                      ListTile(title: Text("Terms & Conditions",style: TextStyle(fontWeight: FontWeight.bold)),trailing: IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsAndConditions(),));
                      }),),Divider(thickness: 2,),
                      ListTile(title: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold)),trailing: IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrivacyPolicy(),));
                      }),),Divider(thickness: 2,),
                    ],),
                  )
                ],),
              ),
            ),

            //profile Picture
            Positioned(
                top: 110,
                left: 158,
                child: Consumer<ProfileController>(
  builder: (context, provider, child) {
  return provider.urlimage==null?CircleAvatar(backgroundImage: AssetImage("images/admin.jpeg"),radius: 40,):
  CircleAvatar(backgroundImage: NetworkImage("${provider.urlimage}"),radius: 40,);
  },
)),
            //appbar
            Custome_appbar_without_image(middle: "Profile",icon: Icons.arrow_back,endicon: Icons.exit_to_app),
          ],),
      ),
    );
  }
}
