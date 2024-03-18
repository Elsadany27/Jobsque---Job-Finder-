import 'package:firbase/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custome_column_bottombar.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
  builder: (context, provider, child) {
  return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: [
             CustomeColumn(ontap:(){provider.Moving(0);},icon:Icons.home,Textt: "Home"),
             CustomeColumn(ontap: (){provider.Moving(1);},icon:Icons.message,Textt: "Message"),
             CustomeColumn(ontap:(){provider.Moving(2);},icon:Icons.work,Textt: "Applied"),
             CustomeColumn(ontap: (){provider.Moving(3);},icon:Icons.save_rounded,Textt: "Saved"),
             CustomeColumn(ontap:(){provider.Moving(4);},icon:Icons.person,Textt: "Profile")
            ]),
          ),
        ),

    body:provider.pages.elementAt(provider.currentpage) ,
    );
  },
);
  }
}
