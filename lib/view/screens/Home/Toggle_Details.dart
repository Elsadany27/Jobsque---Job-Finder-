import 'package:firbase/controller/Details_controller.dart';
import 'package:firbase/controller/home_controller.dart';
import 'package:firbase/view/screens/Home/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Describtion_Screen.dart';
import 'company_screen.dart';
import 'custome_screen_people.dart';

class ToggleDetails extends StatelessWidget {
   ToggleDetails({super.key,required this.content1,required this.content2,required this.content3});
  String? content1,content2,content3;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Consumer<DetailsController>(
          builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(15),
                    focusColor: Colors.blue,

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${content1}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${content2}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${content3}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                    onPressed: (index) => provider.ChangePages(index),
                    isSelected:provider.selected ,
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: provider.pageController,
                    children: [
                      Describtion(),
                      CompanyPage(),
                      PeopleJobs()
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

}




// setState(() {
//   if (index == 0 ) {
//     pageController.nextPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut);
//   }else if(index==1){
//     pageController.nextPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut);
//     selected=[false,true,false];
//   }
//   else if(index==2){
//     pageController.nextPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut);
//     selected=[false,false,true];
//   }
//
//   else if(index==0||index==1||index==2){
//     pageController.previousPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut);
//   }