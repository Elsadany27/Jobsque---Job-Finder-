import 'package:firbase/view/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/Details_controller.dart';
import '../../../../controller/Register_login_controller.dart';
import '../../../../controller/SearchController.dart';
import '../Details_Screen.dart';
import 'nodata.dart';

class LocationFilter extends StatelessWidget {
   LocationFilter({super.key});
   
   SizedBox size=SizedBox(height: 20,);

   //data
   List datalocation=[
     "Remote","Onsite","Hybird","Any"
   ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 200,
      child: Consumer<SearchControllerr>(
  builder: (context, providerr, child) {
  return ListView(children: [
    
        Text("On-Site/Remote",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        size,

        //location job

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(4, (index) =>InkWell(
              onTap:(){
                providerr.ChangeSatate(index);
              } ,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:providerr.select==index?Colors.blue:Colors.white60,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 1,color: Colors.black,)
                ),
                height: 40,
                width: 60,
                child: Text("${datalocation[index]}"),
              ),
            ))
          ],),
    size,

    //button
    Consumer<DetailsController>(
  builder: (context, provider, child) {
  return CustomeButton(ontap: ()async{

    //get data
      FutureBuilder(
        future: provider.getdatafilter(context),
        builder:(context, snapshot)=>snapshot.data!.data!.isNotEmpty?ListView(children: [DetailsPage()],):
            ListView(children: [EmptyDataPage()],)
      );
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmptyDataPage(),));
    },textt: "Show result",fontsize: 15,);
  },
),
    // Text("${providerr.salary.text}"),
    // Text("${providerr.namee}")

      ],);
  },
),
    );
  }
}
