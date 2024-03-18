import 'package:firbase/view/widgets/custome_listtile_with_switch.dart';
import 'package:flutter/material.dart';

import '../../../widgets/Custome_appbar_without_image.dart';

class NotificationSettings extends StatelessWidget {
   NotificationSettings({super.key});

   List job_notification=["Your Job Search Alert","Job Application Update","Job Application Reminders","Jobs You May Be Interested In","Job Seeker Updates"];
   List OtherNotification=["Show Profile","All Message","Message Nudges"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(children: [
        //appbar
        Custome_appbar_without_image(middle: "Notification",icon: Icons.arrow_back,),SizedBox(height: 40,),

        //Job notification
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          padding:EdgeInsets.only(left: 10) ,
          height: 30,
          color: Colors.black12,
          child: Text("Job notification",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
        ),SizedBox(height: 10,),

        Container(
          height: 300,
          child: ListView.separated(
              itemBuilder: (context, index) => CustomeListTileSwitch(
                title: "${job_notification[index]}",
              ),
              separatorBuilder: (context, index) => Divider(thickness: 2,),
              itemCount: job_notification.length),
        ),SizedBox(height: 20,),

        //Other notification
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          padding:EdgeInsets.only(left: 10) ,
          height: 30,
          color: Colors.black12,
          child: Text("Other notification",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
        ),

        Container(
          height: 300,
          child: ListView.separated(
              itemBuilder: (context, index) => CustomeListTileSwitch(
                title: "${OtherNotification[index]}",
              ),
              separatorBuilder: (context, index) => Divider(thickness: 2,),
              itemCount: OtherNotification.length),
        ),



      ],)),
    );
  }
}
