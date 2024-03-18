import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../chat/pages/login_page.dart';
import '../model/JobModel.dart';
import '../view/screens/Home/Apllied/Biodata.dart';
import '../view/screens/Home/Home_Screen.dart';
import '../view/screens/profile/profile.dart';
import '../view/screens/save & Notification/saved/saved.dart';


class HomeController extends ChangeNotifier{
  // String? name;
  int currentpage=0;
  String? nameofjob;

  // //get username
  // chexkname() {
  //   if (name == null) {
  //     return "error";
  //   }
  //   else {
  //     return name;
  //   }
  // }

  //getdata from api
  Dio dio=Dio();
  String url="https://project2.amit-learning.com/api/jobs?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";
  Future<JobModel> getdata()async{

    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer 4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W ";

    Response response=await dio.get(url);
    print("\nBody ${response.data} stutus ${response.statusCode}");

    return JobModel.fromJson(response.data);
  }

  //botton navigation bar
  List<Widget> pages=[
    HomePage(),
    LoginPage(),
    Biodata(),
    SavedPage(),
    ProfilePage()
  ];
  Moving(int i){
    currentpage=i;
    notifyListeners();
  }

  //get search
  // List jobs=[];
  // getname(String name){
  //   titlejob=name;
  //     jobs.add(titlejob);
  //   notifyListeners();
  // }

  //check name to transfere to details page
  checkname() {
    if (nameofjob == null) {
      return "error";
    }
    else {
      return nameofjob;
    }
  }

}