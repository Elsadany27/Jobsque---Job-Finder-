import 'package:flutter/material.dart';
import '../screens/Home/Apllied/Biodata.dart';

import 'custome_button.dart';
import 'custome_container_home.dart';

class CustomeCard extends StatelessWidget {
  CustomeCard( {this.image, this.jobname, this.jobtimetype,
      this.compName, this.jobtype, this.salary,required this.ontap});
SizedBox size=SizedBox(height: 25,);

String? image,jobname,jobtimetype,compName,jobtype,salary;
 final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage("${image}"),fit: BoxFit.fill)),
            ),
            SizedBox(width: 10,),
            Text("${jobname}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(width: 80,),
            InkWell(
                onTap: ontap,
                child: Image(image: AssetImage("images/archive-minus.png"),width: 15,height: 15,))
          ],),
          size,
          Row(children: [
            CustomeContainer(textt: "${jobtimetype}",color: Colors.white),
            CustomeContainer(textt: "${compName}",color: Colors.white,),
            CustomeContainer(textt: "${jobtype}",color: Colors.white,),
          ],),size,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("${salary} /Month",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
              size,
              Container(width: 100,height:30,child: CustomeButton(textt: "Apply Now",ontap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Biodata(),));
              },fontsize: 12,)),
            ],)
        ],),
      ),
    );
  }

}
