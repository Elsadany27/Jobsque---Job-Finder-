import 'package:flutter/material.dart';

import '../../widgets/custome_button.dart';
import 'data.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  SizedBox size = SizedBox(
    height: 25,
  );
  int? currentpage = 0;
  PageController pageController = PageController();

  //List
  List<data> Data = [
    data(image: "images/Background.jpg", content: "images/Tittle.jpg"),
    data(image: "images/Background2.jpg", content: "images/Tittle2.jpg"),
    data(image: "images/Background3.jpg", content: "images/Tittle3.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      image: AssetImage("images/Logo.png"),
                      width: 70,
                      height: 20,
                      fit: BoxFit.fill),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("register");
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.end,
                      )),
                ],
              ),
              Container(
                width: double.infinity,
                height: 600,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentpage = value!;
                    });
                  },
                  controller: pageController,
                  itemCount: Data.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("${Data[index].image}"),
                                fit: BoxFit.fill)),
                      ),
                      size,
                      Image(image: AssetImage("${Data[index].content}")),
                      size,
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      3,
                      (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            margin: EdgeInsets.only(left: 3),
                            width: currentpage == index ? 15 : 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: currentpage == index
                                    ? Colors.orange
                                    : Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10)),
                          ))
                ],
              ),
              size,
              size,
              currentpage == 2
                  ? CustomeButton(
                      textt: "Next",
                      ontap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "register", (route) => false);
                      },
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
