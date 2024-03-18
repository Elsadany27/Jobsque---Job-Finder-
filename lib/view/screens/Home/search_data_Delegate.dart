// import 'package:firbase/controller/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../widgets/custome_card_white.dart';
// import 'Details_Screen.dart';
// import 'Suggestions_search.dart';
//
// class SearchData extends SearchDelegate {
//   List jobs = [
//     "Test Engineers",
//     "Machine Learning",
//     "Flutter Developer"
//   ];
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(onPressed: () {
//         query = " ";
//       }, icon: Icon(Icons.close))
//     ];
//   } //like action in appbar
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(onPressed: () {
//       close(context, null);
//     }, icon: Icon(Icons.arrow_back),);
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return DetailsPage();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // List<Widget> jobs = [
//     //   Text("${Provider.of<HomeController>(context).titlejob}"),
//     // ];
//     List filter = jobs.where((element) => element.contains(query)).toList();
//     return Consumer<HomeController>(
//       builder: (context, provider, child) {
//         return ListView.builder(
//             itemCount: query == "" ? jobs.length : filter.length,
//             itemBuilder: (context, index) =>
//                 InkWell(
//                   onTap: () {
//                     showResults(context);
//                     provider.nameofjob = query;
//                     print(provider.nameofjob);
//                   },
//                   child: Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     width: 50,
//                     height: 50,
//                     color: Colors.greenAccent,
//                     child: query == "" ? Text("${jobs[index]}") : Text(
//                         "${filter[index]}"),
//                   ),
//                 ));
//       },
//     );
//   }
//
// }
