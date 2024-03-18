import 'package:firbase/controller/SavedController.dart';
import 'package:firbase/view/screens/save%20&%20Notification/saved/saved_No_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/Custome_appbar_without_image.dart';
import '../../../widgets/custome_options.dart';
import '../../Home/Apllied/Biodata.dart';
import '../../Home/search/nodata.dart';


class SavedPage extends StatelessWidget {
   SavedPage({super.key});
  SizedBox size=SizedBox(height: 20,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SavedController>(
          builder: (context, provider, child) {
            return FutureBuilder(
              future:provider.getdata(context),
              builder: (context, snapshot) =>Column(children: [
                //appbar
                Custome_appbar_without_image(
                    icon: Icons.arrow_back, middle: "Saved"),size,
                //number of job saved
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: Text("${snapshot.data?.data!.length}  Job Saved",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                ),

                //show job saved

                Container(
                  height: 650,
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(thickness: 2,),
                      itemCount:snapshot.data!.data!.length,
                      itemBuilder: (context, index) => snapshot.hasData?Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(image: NetworkImage("${snapshot.data!.data![index].jobs!.image}"),fit: BoxFit.fill)),
                                ),
                                SizedBox(width: 10,),
                                Text("${snapshot.data!.data![index].jobs!.name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                                SizedBox(width: 50,),

                                //options saved job
                                IconButton(onPressed: (){
                                  showModalBottomSheet(context: context, builder:(context) =>Container(
                                    // margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(20),
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(width: 2,color: Colors.black12)
                                    ),
                                    child: Column(children: [
                                      CustomeOptions(name: "Apply Job",icon: Icons.work,ontap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Biodata() ,));
                                      }),size,
                                      CustomeOptions(name: "Share via...",icon: Icons.upload,ontap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SavedNoData(),));
                                      }),size,
                                      CustomeOptions(name: "Cancel save",icon: Icons.save_rounded,ontap: (){
                                        provider.deletejob(context);
                                      }),
                                    ],),
                                  ) ,);
                                }, icon:Icon(Icons.more_horiz_outlined))
                              ],),
                            size,
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Posted 2 days ago",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.black),),
                                Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    Text("Be an early applicant",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.black),),
                                  ],
                                ),
                              ],
                            ),
                          ],),
                        ),
                      ):snapshot.data!.data!.isEmpty?SavedNoData():
                      snapshot.hasError?Center(child: Text("Error")):CircularProgressIndicator(),
                ))
              ],),
            );
          },
        ),
      ),
    );
  }
}
