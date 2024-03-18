import 'package:firbase/view/screens/Home/Apllied/upload_portfolio.dart';
import 'package:firbase/view/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/applied_controller.dart';
import '../../../widgets/custome_appbar.dart';

class TypeOfJob extends StatelessWidget {
   TypeOfJob({super.key});

  //global variables
  SizedBox size=SizedBox(height: 25,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ApliedController>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Custome_appbar(icon: Icons.arrow_back,middle: "Applied Job",image: "images/Logo.png"),
              size,
              //counter
              Center(child: Image(image: AssetImage("images/Step2.png"))),
              size,
              Text("Type of Work",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("Fill in your bio data correctly",style: TextStyle(fontSize: 10),),size,size,

              //show jobs
              FutureBuilder(
                future: provider.getdata(),
                builder: (context, snapshot) => Container(
                  width: double.infinity,
                  height:450,
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: snapshot.data?.data!.length,
                      itemBuilder: (context, index) => snapshot.hasData?Container(
                        margin: EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2,color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: ListTile(
                          title: Text("${snapshot.data!.data![index].name } "),
                          subtitle: Text("CV.pdf*Portfolio.pdf"),
                          trailing: Radio(value: "${snapshot.data!.data![index].name}",groupValue:provider.jobss,
                          onChanged: (value) {
                            provider.RadioChange(value);
                            provider.jobtype=snapshot.data!.data![index].name;
                          },),
                        ),
                      ):snapshot.hasError?Center(child: Text("Missed Data")):Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              size,
              //button
              CustomeButton(ontap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Portfolio(),));
              },textt: "Next",)
            ],),
          );
        },
      ),
    );
  }
}
