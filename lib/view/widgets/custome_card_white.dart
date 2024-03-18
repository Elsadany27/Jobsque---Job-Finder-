import 'package:firbase/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custome_button.dart';
import 'custome_container_home.dart';

class CustomeCardW extends StatelessWidget {
  CustomeCardW({this.image, this.jobname, this.jobtimetype, this.compName,
      this.jobtype, this.salary,required this.ontap});

  SizedBox size=SizedBox(height: 25,);
  final VoidCallback ontap;

  String? image,jobname,jobtimetype,compName,jobtype,salary;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
                  image: DecorationImage(image: AssetImage("${image}"),fit: BoxFit.fill)),
            ),
            SizedBox(width: 10,),
            Text("${jobname}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(width: 50,),
            InkWell(
                onTap: ontap,
                child: Image(image: AssetImage("images/archive-minus.png"),width: 20,height: 20,color: Colors.red,),)
          ],),
          size,
          Row(children: [
            CustomeContainer(textt: "${jobtimetype}",),
            CustomeContainer(textt: "${compName}",),
            CustomeContainer(textt: "${jobtype}",),
          ],),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("${salary} /Month",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
            ],
          ),
        ],),
      ),
    );
  }


}
