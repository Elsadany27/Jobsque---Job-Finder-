import 'dart:io';
import 'package:firbase/view/screens/Home/Apllied/successful.dart';
import 'package:firbase/view/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../controller/applied_controller.dart';
import '../../../widgets/custome_appbar.dart';

class Portfolio extends StatelessWidget {
   Portfolio({super.key});
    SizedBox size=SizedBox(height: 25,);

//    File? file;
//    gettimage()async{
//      final ImagePicker picker = ImagePicker();
// // Pick an image.
// //     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//
//      // Capture a photo.
//      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
//      file=File(photo!.path);
//    }

   // Dio dio=Dio();
   // // String url="https://project2.amit-learning.com/api/jobs?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";
   // String url="https://project2.amit-learning.com/api/user/profile/portofolios?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";
   // Future<portfolio> getdata()async{
   //
   //   dio.options.headers['Content-Type']='application/json';
   //   dio.options.headers["Authorization"]="Bearer 4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W ";
   //
   //   Response response=await dio.post(url,data: [
   //     {"file":"https://drive.google.com/file/d/1DPcUSuiXDVDNdbgJWKSONm6EZE1pa6hY/view?usp=drive_link"},
   //   ]);
   //   print("\nBody ${response.data} stutus ${response.statusCode}");
   //
   //   return portfolio.fromJson(response.data);
   // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ApliedController>(
  builder: (context, provider, child) {
  return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            //appbar
            Custome_appbar(icon: Icons.arrow_back,middle: "Applied Job",image: "images/Logo.png"),
            size,
            //counter
            Center(child: Image(image: AssetImage("images/step3.png"))),
            size,
            Text("Upload portfolio",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
            Text("Fill in your bio data correctly",style: TextStyle(fontSize: 12),),size,size,
              size,

              //show pdf cv
              provider.filename==null?Container():Center(child: Container(
                height: 40,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                  border: Border.all(width: 1,color: Colors.black)
                ),
                child: Text("${provider.filename}",style: TextStyle(
                   fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
              )),


              //upload cv
              size,
              Text("Upload CV*",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),size,
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 22),
                  padding: EdgeInsets.all(15),
                  width: 300,
                  height: 200,
                  decoration:BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                      children: [
                    Icon(Icons.upload_file,),size,
                    Text("Upload your other file",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    size,size,
                    MaterialButton(onPressed: (){
                      provider.pickfile();
                    },child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Icon(Icons.upload_file),
                      Text("Add File")
                    ]),elevation: 25,color: Colors.grey,shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 2,color: Colors.black)
                    ),)
                  ]),
                ),
              ),SizedBox(height: 60,),


         CustomeButton(ontap: (){
                // postdata();
                  provider.senddataApply("${provider.urlpdf}",
                      "${provider.fullname}",
                      "${provider.email}",
                      "${provider.phone}",
                      "${provider.jobtype}", context);
              
              },textt: "Submit",),


              // Text("${Provider.of<ApliedController>(context).jobtype}")

          ],),
        );
  },
),
      ),
    );
  }
}
