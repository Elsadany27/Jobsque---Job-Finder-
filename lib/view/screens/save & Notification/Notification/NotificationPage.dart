import 'package:firbase/model/JobModel.dart';
import 'package:firbase/view/screens/save%20&%20Notification/Notification/NoNotification.dart';
import 'package:flutter/material.dart';

import '../../../widgets/Custome_appbar_without_image.dart';
import 'data.dart';

class NotificationPage extends StatelessWidget {
   NotificationPage({super.key});
  SizedBox size=SizedBox(height: 20,);

  List<DataNotify> data=[
    DataNotify(title: "Dana",image: "images/Dana Logo.png",subtitle:"Posted new design jobs",time: "10.00AM" ),
    DataNotify(title: "Shoope",image: "images/Shoope Logo.png",subtitle:"Posted new design jobs",time: "10.00AM" ),
    DataNotify(title: "Slack",image: "images/Slack Logo.png",subtitle:"Posted new design jobs",time: "10.00AM" ),
    DataNotify(title: "Facebook",image: "images/Facebook Logo.png",subtitle:"Posted new design jobs",time: "10.00AM" ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Custome_appbar_without_image(icon: Icons.arrow_back, middle: "Notification"),size,
        //number of job saved
        Container(padding: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          child: Text("New",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
        ),

       Container(
         height: 700,
         child: ListView.separated(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             itemBuilder: (context, index) =>data.isNotEmpty?
         ListTile(
           title:Text("${data[index].title} ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
           subtitle: Text("${data[index].subtitle}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),
           trailing: Text("${data[index].time}"),
           leading: Image.asset("${data[index].image}"),
         ):
             Column(
             children: [
               size,
               //appbar
               // Custome_appbar_without_image(icon: Icons.arrow_back,middle: "Notification"),
               //
               size,size,size,
               Container(
                 width: 250,
                 height: 300,
                 decoration: BoxDecoration(
                     image: DecorationImage(image: AssetImage("images/Notification Ilustration.png"),fit: BoxFit.contain)
                 ),
               ),size,

               //text
               Text("No new notifications yet",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
               SizedBox(height: 10,),
               Center(child: Text("You will receive a notification if there is\n something on your account",
                 style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),textAlign: TextAlign.center,)),
             ]),
             separatorBuilder: (context, index) => Divider(thickness: 2,),
             itemCount: data.length),
       )
      ],),
    );
  }
}
