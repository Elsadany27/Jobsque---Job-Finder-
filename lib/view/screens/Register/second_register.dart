import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/Register_login_controller.dart';
import '../../widgets/custome_button.dart';
import 'Data_Register.dart';

class SecondRegister extends StatefulWidget {
   SecondRegister({super.key});

  @override
  State<SecondRegister> createState() => _SecondRegisterState();
}

class _SecondRegisterState extends State<SecondRegister> {
  SizedBox size=SizedBox(height: 25,);

  int? selectt;

  List<DataRegister> data=[
    DataRegister(image: "images/job1.png",job: "UI/UX Designer "),
    DataRegister(image: "images/job2.png",job: "Ilustrator Designer"),
    DataRegister(image: "images/job1.png",job: "Developer"),
    DataRegister(image: "images/job2.png",job: "Management"),
    DataRegister(image: "images/job1.png",job: "Information Technology"),
    DataRegister(image: "images/job1.png",job: "Research and Analytics"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<RegisterLogin>(
  builder: (context, provider, child) {
  return SingleChildScrollView(
    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                size,
              Text("What type of work are you\n interested in ?",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              size,
              Text("Tell us what you're interested in so we can customise the app for your need",style: TextStyle(fontSize: 15),),
                size,
            Container(
              height: 500,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:1.25 ,mainAxisSpacing: 12),
              itemCount: data.length,
                itemBuilder: (context, index) =>  InkWell(
                  onTap: () {
                    setState(() {
                      provider.select=index;
                    });
                  },
                  child: Card(
                    color:provider.select==index?Colors.green:Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(backgroundImage: AssetImage("${data[index].image}"),),
                          size,
                          Text("${data[index].job}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
                        ]),
                  ),
                ),
              ),
            ),
//button
                CustomeButton(textt: "Next",ontap: (){
                  Navigator.of(context).pushNamed("thirtscreen");
                },)

            ],),
  );
  },
),
        ),
      ),
    );
  }
}

