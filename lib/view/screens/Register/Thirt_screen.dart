import 'package:firbase/view/screens/Register/location1.dart';
import 'package:firbase/view/screens/Register/location2.dart';
import 'package:flutter/material.dart';

import '../../widgets/custome_button.dart';



class ThirtScreen extends StatefulWidget {
   ThirtScreen({super.key});

  @override
  State<ThirtScreen> createState() => _ThirtScreenState();
}

class _ThirtScreenState extends State<ThirtScreen> {
  SizedBox size=SizedBox(height: 25,);
  int? select=1;
  //list toggle buttons
   List<bool> selected=[true,false];
   PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              size,
            Text("Where are you prefefred Location?",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            size,
            Text("Let us know, where is the work location you want at this time, so we can adjust it.",style: TextStyle(fontSize: 15),),
             size,size,size,
              //toggle button
              Container(
                height: 400,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: ToggleButtons(
                            borderRadius: BorderRadius.circular(15),
                            fillColor: Colors.black,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Work From Office',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Remote Work',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                if (index == 1) {
                                  pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                } else {
                                  pageController.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                }
                                for (int i = 0; i < selected.length; i++) {
                                  selected[i] = i == index;
                                }
                              });
                            },
                            isSelected: selected,
                          ),
                        ),
                      ),
                      Expanded(
                        child: PageView(
                          controller: pageController,
                          children: [
                            Location1(),
                            Location2(),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
         //button
              size,
              //button
              CustomeButton(textt: "Next",ontap: (){
                Navigator.of(context).pushNamed("successpage");
              },)

          ],),
        ),
      ),
    );
  }
}
