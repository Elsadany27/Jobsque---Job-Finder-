import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/applied_controller.dart';
import '../../../widgets/custome_appbar.dart';
import '../../../widgets/custome_button.dart';
import '../../../widgets/custome_textformfield.dart';

class Biodata extends StatelessWidget {
   Biodata({super.key});
  SizedBox size=SizedBox(height: 25,);
   int? currentpage = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ApliedController>(
  builder: (context, provider, child) {
  return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Custome_appbar(icon: Icons.arrow_back,middle: "Applied Job",image: "images/Logo.png"),
            size,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                    3,
                        (index) => AnimatedContainer(
                          alignment: Alignment.center,
                          child:currentpage==index? Icon(Icons.arrow_forward_outlined):Text("$index"),
                      duration: Duration(milliseconds: 400),
                      margin: EdgeInsets.only(left: 3),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: currentpage == index
                              ? Colors.orange
                              : Colors.blueAccent,
                          borderRadius: BorderRadius.circular(50)),
                    ))
              ],
            ),
            size,size,
            Text("Biodata",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text("Fill in your bio data correctly",style: TextStyle(fontSize: 15),),size,size,

            //fullname
            Text("Fullname *",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            CustomeTextformfield(name: "Fullname",icon: Icon(Icons.person,color: Colors.black,),controller: provider.fullname),

            size,
            //email
            Text("Email *",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            CustomeTextformfield(name: "Email",icon: Icon(Icons.email,color: Colors.black,),controller: provider.email),
            size,

          //phone
            Text("Phone *",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
          DropdownButton(
            alignment: Alignment.center,
            dropdownColor: Colors.black,
            elevation: 60,
            style: TextStyle(color: Colors.redAccent,fontSize: 15,fontWeight: FontWeight.bold),
            borderRadius: BorderRadius.circular(15),
            value: provider.selected,
            items: provider.jobs.map((e) => DropdownMenuItem(child: Text("$e"),value:e)).toList(),
            onChanged: (val) {
              provider.ChangeState(val!);
            },
          ),
            CustomeTextformfield(name: "Phone",icon: Icon(Icons.phone,color: Colors.black),controller: provider.phone,),
            size,size,
            CustomeButton(ontap: (){
              currentpage==0?Navigator.of(context).pushNamed("Typeofjob"):Navigator.of(context).pushNamed("portfolio");
            },textt: "Next",)

          ],),
        );
  },
),
      ),
    );
  }
}
