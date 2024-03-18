import 'package:firbase/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/custome_container_company.dart';

class CompanyPage extends StatelessWidget {
   CompanyPage({super.key});
  SizedBox size=SizedBox(height: 20,);
    @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        return FutureBuilder(
          future: provider.getdata(),
          builder: (context, snapshot) =>snapshot.hasData? ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Center(child: Text("Contact Us",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                size,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CustomeContainerCompany(text1: "Email",text2: "${snapshot.data!.data![index].compEmail}",),
                  CustomeContainerCompany(text1: "Website",text2: "${snapshot.data!.data![index].compWebsite}",),
                ],),
                size,
                Text("About Company",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                  size,
                  Text("${snapshot.data!.data![index].aboutComp}",style: TextStyle(fontSize: 15),),
              ],),
            ),
          ):snapshot.hasError?Text("Missed Data"):Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
