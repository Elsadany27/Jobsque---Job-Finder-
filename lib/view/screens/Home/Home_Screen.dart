import 'package:firbase/controller/SavedController.dart';
import 'package:firbase/controller/home_controller.dart';
import 'package:firbase/view/screens/Home/search/FirstPage.dart';
import 'package:firbase/view/screens/Home/search_data_Delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/Register_login_controller.dart';
import '../../Login/provider/login_controller.dart';
import '../../widgets/custome_card.dart';
import '../../widgets/custome_card_white.dart';
import '../save & Notification/Notification/NotificationPage.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});
  SizedBox size=SizedBox(height: 25,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Consumer<HomeController>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                  children:[ FutureBuilder(
                    future: provider.getdata(),
                    builder:(context, snapshot) =>Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Provider.of<RegisterLogin>(context,listen: false).username!=null?
                              Text("Hi ,${Provider.of<RegisterLogin>(context,listen: false).username}👋",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),):
                              Text("Hi ,${Provider.of<RegisterLogin>(context,listen: false).usernamel}👋",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              size,
                              Text("Create a better future for yourself here",style: TextStyle(fontSize: 15),),
                            ],),
                          IconButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationPage(),));
                          }, icon:Icon(Icons.notifications,size: 40,color:Colors.deepOrange,)),
                        ],),
                      size,
                      //search
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPageSearch(),));
                        },
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide(color: Colors.black,width: 1)),
                            prefixIcon: Icon(Icons.search,color: Colors.black,),
                            hintText: "Search",
                          ),
                        ),
                      ),size,

                      //suggest job
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Suggested Job",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text("View all")
                        ],),
                      size,

                      //card
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.data!.length,
                            itemBuilder: (context, index) =>
                            snapshot.hasData
                                ? Consumer<SavedController>(
  builder: (context, providerr, child) {
  return CustomeCard(image:"${snapshot.data!.data![index].image}"
                              , jobname:"${snapshot.data!.data![index].name}"
                              , jobtimetype:"${snapshot.data!.data![index].jobTimeType}"
                              , compName:"${snapshot.data!.data![index].compName}",
                              jobtype:"${snapshot.data!.data![index].jobType}",
                              salary:"${snapshot.data!.data![index].salary}",
                              ontap: (){
                                  providerr.jobId=snapshot.data!.data![index].id;
                                  providerr.SavedJob(context);
                              },);
  },
)
                                : snapshot.hasError ? Text("Error") : Center(
                                child: CircularProgressIndicator())
                        ),
                      ),
                      size,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Recent Job",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text("View all")
                        ],),
                      size,

                      //second card
                      Container(
                        height: 250 ,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(thickness: 3,),
                          itemCount: 2,
                          itemBuilder: (context, index) =>snapshot.hasData? Consumer<SavedController>(
  builder: (context, value, child) {
  return CustomeCardW(
                            ontap: (){
                              value.jobId=snapshot.data!.data![index].id;
                              value.SavedJob(context);
                            },
                              image: "images/Discord Logo.png",
                              jobname: "${snapshot.data!.data![index].name}",
                              jobtimetype: "${snapshot.data!.data![index].jobTimeType}",
                              compName: "${snapshot.data!.data![index].compName}",
                              jobtype: "${snapshot.data!.data![index].jobType}",
                              salary: "${snapshot.data!.data![index].salary}");
  },
):
                          snapshot.hasError?Text("Error"):Center(child: CircularProgressIndicator()),),
                      ),

                    ],),

                  ),

                  ]),
            );
          },
        ),
      ) ,
    ) ;
  }
}
