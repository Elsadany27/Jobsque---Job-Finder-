
import 'package:flutter/material.dart';

import 'Data_Register.dart';

class Location2 extends StatefulWidget {
  const Location2({super.key});

  @override
  State<Location2> createState() => _Location2State();
}

class _Location2State extends State<Location2> {
  int? select=0;
  //list toggle buttons
  List<bool> selected=[true,false];
  PageController pageController=PageController();
  List<DataThirt> data=[
    DataThirt(countryname: "palestine",image:"images/palstine.jpeg" ),
    DataThirt(countryname: "Malaysia",image:"images/malysia.png" ),
    DataThirt(countryname: "Indonesia",image:"images/Ellipse.png" ),
    DataThirt(countryname: "Polandia",image:"images/polandapng.png" ),
    DataThirt(countryname: "China",image:"images/india.png" ),
    DataThirt(countryname: "China",image:"images/china.png" ),
    DataThirt(countryname: "Canada",image:"images/canda.png" ),
    DataThirt(countryname: "Saudi Arabia",image:"images/suadi.png" ),
    DataThirt(countryname: "Argentina",image:"images/messi.png" ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Select the country you want for your job",style: TextStyle(fontSize: 15),),
SizedBox(height: 20,),
      //Gridview

      Container(
        height: 250,
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 3,crossAxisCount: 3,mainAxisSpacing: 10,childAspectRatio: 2.25),
          itemCount: data.length,
          itemBuilder: (context, index) =>InkWell(
            onTap: () {
              setState(() {
                select=index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: select==index?Colors.blue:Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(backgroundImage: AssetImage("${data[index].image}",),radius: 12,),
                  Text("${data[index].countryname}"),
                ],),
            ),
          ) ,
        ),
      ),

    ],
    );}
}
