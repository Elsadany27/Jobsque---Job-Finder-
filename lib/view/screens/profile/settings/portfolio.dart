import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/ProfileController.dart';
import '../../../widgets/Custome_appbar_without_image.dart';



class PortfolioProfile extends StatelessWidget {
   PortfolioProfile({super.key});
  SizedBox size=SizedBox(height: 20,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
        Consumer<ProfileController>(
  builder: (context, provider, child) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      //appbar
      Custome_appbar_without_image(middle: "Portfolio",icon: Icons.arrow_back),
      size,
        //upload cv
            size,
            Text("Add portfolio here",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),size,
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 22),
                padding: EdgeInsets.all(15),
                width: 300,
                height: 200,
                decoration:BoxDecoration(
                    color: Color(0xff3366FF),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Column(
                    children: [
                      Icon(Icons.upload_file,),size,
                      Text("Upload your other file",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      size,size,
                      MaterialButton(onPressed: (){
                        provider.pickfile();
                        provider.SendPortfolio(provider.urlpdf.toString(), context);
                      },child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_file,color: Colors.white,),SizedBox(width: 10,),
                            Text("Add File",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),)
                          ]),elevation: 25,color: Color(0xff3366FF),shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(width: 2,color: Colors.black)
                      ),)
                    ]),
              ),
            ),SizedBox(height: 60,),
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

          ],),
  );
  },
),),
    );
  }
}
