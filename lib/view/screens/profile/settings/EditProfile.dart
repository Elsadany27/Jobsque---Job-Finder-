import 'package:firbase/view/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/ProfileController.dart';
import '../../../widgets/Custome_appbar_without_image.dart';
import '../../../widgets/custome_button.dart';
import '../../../widgets/custome_textformfield.dart';

class EditProfile extends StatelessWidget {
   EditProfile({super.key});
  TextEditingController name=TextEditingController();
  TextEditingController bio=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController about=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ProfileController>(
  builder: (context, provider, child) {
  return ListView(
              children: [
            //appbar
            Custome_appbar_without_image(middle: "Edit Profile",icon: Icons.arrow_back),
            //picture
            SizedBox(height: 40,),
            Center(
              child: Stack(children: [
              CircleAvatar(backgroundImage: NetworkImage("${provider.urlimage}"),radius: 50,),
                Positioned(left: 15,top: 20,child: IconButton(onPressed: (){
                  provider.gettimage();
                }, icon: Icon(Icons.camera_alt,size: 55,)))
              ],),
            ),
            Center(child: TextButton(child:Text("Change Photo",style: TextStyle(color: Color(0xff3366FF),fontSize: 15)),onPressed: (){},)),SizedBox(height: 30,),
            //form

             //name
            Text("Name",style: TextStyle(fontWeight: FontWeight.w700,color: Color(0xff9CA3AF)),),
            SizedBox(height: 8,),
            CustomeTextformfield(name: "Name",controller: name),SizedBox(height: 20,),
            //bio
            Text("Bio",style: TextStyle(fontWeight: FontWeight.w700,color: Color(0xff9CA3AF)),),
            SizedBox(height: 8,),
            CustomeTextformfield(name: "Bio",controller: bio),SizedBox(height: 20,),
            //address
            Text("Address",style: TextStyle(fontWeight: FontWeight.w700,color: Color(0xff9CA3AF)),),
            SizedBox(height: 8,),
            CustomeTextformfield(name: "Address",controller: address),SizedBox(height: 20,),
            //No.Handphone
            Text("No.Handphone",style: TextStyle(fontWeight: FontWeight.w700,color: Color(0xff9CA3AF)),),
            SizedBox(height: 8,),
            CustomeTextformfield(name: "No.Handphone",controller: phone),SizedBox(height: 20,),
           //about
           Text("About",style: TextStyle(fontWeight: FontWeight.w700,color: Color(0xff9CA3AF)),),
            SizedBox(height: 8,),
           CustomeTextformfield(name: "About",controller: about),SizedBox(height: 60,),

             //button
                CustomeButton(ontap: (){
                  // keyprofile.currentState!.validate();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ProfilePage(username: name.text,bio: bio.text,about: about.text),), (route) => false);
                },textt: "Save",fontsize: 18,),SizedBox(height: 10,)
          ]);
  },
),
        ),),
    );
  }
}
