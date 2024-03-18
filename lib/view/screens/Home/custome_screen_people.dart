import 'package:flutter/material.dart';
import 'Apllied/data/people_data.dart';


class PeopleJobs extends StatelessWidget {
   PeopleJobs({super.key});
  List<PeopleData> people=[
    PeopleData(name: "Youssef Elsadany",joptype: "Flutter Developer",experinse: "Year",image:"ofa.jpg"),
    PeopleData(name: "Noma Ismail",joptype: "Testing Engineer",experinse: "Two Year",image:"FB_IMG_1614551004112.jpg"),
    PeopleData(name: "Mostafa Fahmy",joptype: "Flutter Developer",experinse: "Three Year",image:"FB_IMG_1613423007746.jpg"),
    PeopleData(name: "sara",joptype: "Flutter Developer",experinse: "Year",image:"doo.jpg"),
    PeopleData(name: "Dubai Company",joptype: "Flutter Developer",experinse: "",image:"R.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) => ListTile(
          title: Text("${people[index].name}"),
          subtitle: Text("${people[index].joptype}"),
          leading: CircleAvatar(backgroundImage: AssetImage("images/${people[index].image}"),radius: 20),
          trailing: Text("${people[index].experinse}"),
        ),
    );
  }
}
