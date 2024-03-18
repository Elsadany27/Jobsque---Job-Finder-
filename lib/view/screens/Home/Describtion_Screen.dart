// import 'package:firbase/controller/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class Describtion extends StatelessWidget {
//    Describtion({super.key,required this.nameofjobb});
//   String? nameofjobb;
//   SizedBox size=SizedBox(height: 25,);
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeController>(
//         builder: (context, provider, child) {
//           return FutureBuilder(
//             future:provider.getdata(),
//             builder: (context, snapshot) => snapshot.hasData?ListView.builder(
//               itemCount: 1,
//               itemBuilder: (context, index) {
//                 // provider.nameofjob!.length==snapshot.data!.data!.length?
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Job Describtion",
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight
//                             .bold),),
//                       size,
//                       Text("${snapshot.data!.data![index].jobDescription!}"),
//                       size, size,
//                       Text("Skill Required",
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight
//                             .bold),),
//                       size,
//                       Text("${snapshot.data!.data![index].jobSkill!}"),
//                     ],),
//                 );
//                 // :Text("Not Found");},
//               }
//             ):
//             snapshot.hasError?Center(child: Text("Error")):Center(child: CircularProgressIndicator()),
//           );
//         },
//       );
//   }
// }

import 'package:firbase/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Describtion extends StatelessWidget {
   Describtion({super.key});
  SizedBox size=SizedBox(height: 20,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeController>(
        builder: (context, provider, child) {
          return SafeArea(child:
          FutureBuilder(
              future: provider.getdata(),
            builder: (context, snapshot) => snapshot.hasData?Padding(
              padding: const EdgeInsets.only(top: 15.0,left: 4),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) =>provider.nameofjob==snapshot.data!.data![index].name?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //describtion
                    Text("Describtion",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    size,
                    Text("${snapshot.data!.data![index].jobDescription}"),

                    size,size,
                    //skills
                    Text("Skill Required",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    size,
                    Text("${snapshot.data!.data![index].jobSkill }",softWrap: true),
                  ],
                ):Container(),
              ),
            ):snapshot.hasError?Center(child: Text("Error")):Center(child: CircularProgressIndicator()),
          ),);
        },
      ),
    );
  }
}

