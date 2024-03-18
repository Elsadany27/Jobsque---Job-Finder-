import 'package:firbase/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custome_card_white.dart';

class Suggestion extends StatelessWidget {
   Suggestion({super.key});
  // String? name;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        return FutureBuilder(
            future:provider.getdata(),
            builder: (context, snapshot) => ListView.separated(
              separatorBuilder: (context, index) => Divider(thickness: 3,),
              itemCount:snapshot.data!.data!.length,
              itemBuilder: (context, index) =>snapshot.hasData? CustomeCardW(
                ontap: (){},
              image: "images/Discord Logo.png",
                  jobname: snapshot.data!.data![index].name,
                  jobtimetype:snapshot.data!.data![index].jobTimeType,
                  compName:snapshot.data!.data![index].compName,
                  jobtype: snapshot.data!.data![index].jobType,
                  salary:snapshot.data!.data![index].salary):snapshot.hasError?Text("Error"):Center(child: CircularProgressIndicator()),
            ),
        );
      },
    );
  }
}
