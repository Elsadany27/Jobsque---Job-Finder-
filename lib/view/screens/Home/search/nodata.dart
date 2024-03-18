import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../controller/SearchController.dart';
import '../../../widgets/custome_textformfield.dart';
import 'FilterPage.dart';

class EmptyDataPage extends StatelessWidget {
  EmptyDataPage({super.key});

  SizedBox size = SizedBox(height: 20,);
  List data=[
    "Remote",
    "Full Time",
    "Post Data"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                children: [
                  size,
              //appbar
            Row(children: [
            IconButton(onPressed: (){Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        Expanded(
          flex: 2,
          child: Consumer<SearchControllerr>(
            builder: (context, provider, child) {
              return CustomeTextformfield(
                  icon: Icon(Icons.search, color: Colors.black,), name: "${provider.search.text}");
            },
          ),
        )],),size,

           //settings
              Row(
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

              //

              size,size,size,
              Container(
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/Search Ilustration.png"),fit: BoxFit.contain)
                ),
              ),size,

              //text
              Text("Search not found",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 10,),
              Center(child: Text("Try searching with different keywords so\n we can show you",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),textAlign: TextAlign.center,)),


        ]),
        )
    ,
    );
  }
}
