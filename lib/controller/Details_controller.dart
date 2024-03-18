import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/searchfilter_model.dart';
import 'Register_login_controller.dart';

class DetailsController extends ChangeNotifier{
  PageController pageController=PageController();
  List<bool> selected=[true,false,false];

  ChangePages(int index){
        if (index == 0 ) {
          pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        }else if(index==1){
          pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut);
          selected=[false,true,false];
        }
        else if(index==2){
          pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut);
          selected=[false,false,true];
        }

        else if(index==0||index==1||index==2){
          pageController.previousPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        }
        notifyListeners();
  }

  //get data

  Dio dio=Dio();
  String url="https://project2.amit-learning.com/api/jobs/filter?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";
   Future<SearchFilter> getdatafilter(context)async{

    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer  ${Provider.of<RegisterLogin>(context,listen: false).token} ";

    Response response=await dio.get(url);
    print("\nBody ${response.data} stutus ${response.statusCode}");

    return SearchFilter.fromJson(response.data);
  }
}