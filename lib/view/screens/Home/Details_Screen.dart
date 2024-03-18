import 'package:firbase/controller/home_controller.dart';
import 'package:firbase/view/screens/onboarding/onboarding_screen.dart';
import 'package:firbase/view/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/custome_appbar.dart';
import 'Apllied/Biodata.dart';
import 'Toggle_Details.dart';

class DetailsPage extends StatelessWidget {
   DetailsPage({super.key,this.nameofjobb});

  SizedBox size=SizedBox(height: 25,);
  String? nameofjobb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<HomeController>(
  builder: (context, provider, child) {
  return FutureBuilder(
          future: provider.getdata(),
          builder: (context, snapshot) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
              Column(
                children: [
                  Custome_appbar(icon: Icons.arrow_back,
                    image: "images/archive-minus.png",
                    middle: "Job Detail",
                    color: Colors.black,
                  ),
                ],
              ),
              size,
              //image top screen
              Image(image: AssetImage("images/Discord Logo.png"),width: 60,height: 60,),
              Center(child: Text("$nameofjobb",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold ),)),
              //subtittle
                size,
                Container(
                    height: 520,
                    child: ToggleDetails(content1: "Desicription",content2: "Company",content3: "People",)),

                CustomeButton(ontap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Biodata(),));
                },textt: "Apply Now",),
                size,

            ],),
          ),
        );
  },
),
      ),
    );
  }
}
