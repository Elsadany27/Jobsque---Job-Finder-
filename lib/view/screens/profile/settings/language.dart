import 'package:flutter/material.dart';

import '../../../widgets/Custome_appbar_without_image.dart';
import 'languagedata.dart';

class LanguagePage extends StatefulWidget {
   LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  List<LanguageData> language=[
    LanguageData(image: "images/England.png",language: "English"),
    LanguageData(image: "images/Indonesia.png",language: "Indonesia"),
    LanguageData(image: "images/Saudi Arabia.png",language: "Arabic"),
    LanguageData(image: "images/China.png",language: "Chinese"),
    LanguageData(image: "images/Netherlands.png",language: "Dutch"),
    LanguageData(image: "images/France.png",language: "French"),
    LanguageData(image: "images/Germany.png",language: "German"),
    LanguageData(image: "images/Japan.png",language: "Japanese"),
    LanguageData(image: "images/South Korea.png",language: "Korean"),
    LanguageData(image: "images/Portugal.png",language: "Portuguese"),
  ];

  String? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
        Column(
          children: [
            //appbar
            Custome_appbar_without_image(middle: "Language",icon: Icons.arrow_back),
            SizedBox(height: 20,),

            //content
            Container(
              height: 730,
              child: ListView.separated(itemBuilder:(context, index) =>ListTile(
                title: Text("${language[index].language}"),
                leading: Image.asset("${language[index].image}"),
                trailing: Radio(
                  activeColor: Colors.black,
                  value: "${language[index].language}",groupValue: country,onChanged: (value) {
                  setState(() {
                    country=value;
                  });
                },),
              ),
                  separatorBuilder: (context, index) => Divider(thickness: 2,),
                  itemCount: 10),
            ),
          ],
        )),
    );
  }
}
