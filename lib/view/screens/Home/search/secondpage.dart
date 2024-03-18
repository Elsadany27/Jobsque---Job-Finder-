import 'package:firbase/chat/widgets/custom_button.dart';
import 'package:firbase/view/Login/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../controller/SearchController.dart';
import '../../../../controller/home_controller.dart';
import '../../../widgets/custome_card_white.dart';
import '../../../widgets/custome_textformfield.dart';
import '../Details_Screen.dart';
import 'FilterPage.dart';

class SecondPageSearch extends StatelessWidget {
   SecondPageSearch({super.key});
  

  SizedBox size=SizedBox(height: 20,);


  List data=[
    "Remote",
    "Full Time",
    "Post Data"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:ListView(children: [
          size,
          //appbar
          Consumer<SearchControllerr>(
  builder: (context, provider, child) {
  return Row(children: [
            IconButton(onPressed: (){Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),
            Expanded(
              flex: 2,
              child: CustomeTextformfield(icon: Icon(Icons.search,color: Colors.black,),name: "${provider.search.text}"),),
          ],);
  },
),size,

          //settings filter
          InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder:(context) => FilterPage());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              IconButton(onPressed: (){}, icon:Icon(Icons.settings)),
              ...List.generate(3, (index) =>Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.black12,
                    borderRadius: BorderRadius.circular(15)),
                width: 90,
                height: 40,
                child: Row(children: [
                  Text("${data[index]}"),
                  Icon(Icons.keyboard_arrow_down)
                ],),
              ))
            ],),
          ),


          //jobs
          Consumer<HomeController>(
  builder: (context, provider, child) {
  return FutureBuilder(
              future: provider.getdata(),
              builder: (context, snapshot) => Container(
                margin: EdgeInsets.only(top: 30),
                height: 700,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => snapshot.hasData? InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(nameofjobb: "${snapshot.data!.data![index].name}"),));
                        provider.nameofjob=snapshot.data!.data![index].name;
                      },
                      child: CustomeCardW(
                        ontap: (){},
                          image: "images/Discord Logo.png",
                          jobname: "${snapshot.data!.data![index].name}",
                          jobtimetype: "${snapshot.data!.data![index].jobTimeType}",
                          compName: "${snapshot.data!.data![index].compName}",
                          jobtype: "${snapshot.data!.data![index].jobType}",
                          salary: "${snapshot.data!.data![index].salary}"),
                    ):
                    snapshot.hasError?Text("Error"):Center(child: CircularProgressIndicator()),
                    ),)
              );
  },
),
        ],)
      ),
    );
  }
}
