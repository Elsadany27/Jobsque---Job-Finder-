import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/Register_login_controller.dart';
import '../../../../controller/SearchController.dart';
import '../../../widgets/custome_button.dart';
import '../../../widgets/custome_textformfield.dart';
import 'locationfilter.dart';

class FilterPage extends StatefulWidget {
   FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
   int selected=0;

   SizedBox size=SizedBox(height: 20,);

   List DataSearch=[
     "Full Time","Remote","Contract","Part Time","Onsite","Internship",
   ];

   GlobalKey<FormState> keysearch=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SearchControllerr>(
  builder: (context, provider, child) {
  return Form(
    key: keysearch,
    child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular(25))),
          height: 600,
          child: ListView(children: [
            //appbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.arrow_back)),
                Text("Set Filter",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                TextButton(onPressed: (){
                  provider.jobtitle.clear();
                  provider.salary.clear();
                  provider.location.clear();
                }, child: Text("Reset",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
              ],),size,

            //Textform Data

            Text("Job Title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 10,),
            CustomeTextformfield(ontap: (){},name: "Job Title",icon: Icon(Icons.work,color: Colors.black,),controller: provider.jobtitle),
            size,
            Text("Location",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 10,),
            CustomeTextformfield(ontap: (){},name: "Location",icon: Icon(Icons.location_on,color: Colors.black,),controller: provider.location),

            size,
            Text("Salary",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 10,),
            CustomeTextformfield(ontap: (){},name: "\$10k - \$15k",icon: Icon(Icons.attach_money,color: Colors.black),controller: provider.salary,),

            size,size,


            //design containers job type
            Text("Job Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 10,),
            Container(
              height: 150,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 3,crossAxisCount: 3,mainAxisSpacing: 10,childAspectRatio: 2.25),
                itemCount: DataSearch.length,
                itemBuilder: (context, index) =>InkWell(
                  onTap: () {
                    provider.ChangeState(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: provider.selection==index?Colors.blue:Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${DataSearch[index]}"),
                      ],),
                  ),
                ) ,
              ),
            ),

            //button
            CustomeButton(ontap: (){
              //check if form is empty
              keysearch.currentState!.validate();
              //send data
              provider.SearchFilter(provider.jobtitle.text, provider.location.text, provider.salary.text, context);
              //location of work
              showModalBottomSheet(context: context, builder:(context) =>LocationFilter()) ;
            },textt: "Show result",fontsize: 15,),
            size,
            // Text("${Provider.of<RegisterLogin>(context).token}")
          ],),
        ),
  );
  },
),);
  }
}
