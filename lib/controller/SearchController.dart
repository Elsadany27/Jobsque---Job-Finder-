import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'Register_login_controller.dart';

class SearchControllerr extends ChangeNotifier{
  TextEditingController jobtitle=TextEditingController();
  TextEditingController location=TextEditingController();
  TextEditingController salary=TextEditingController();
  TextEditingController search=TextEditingController();

  dynamic? namee;

  //search filter
  Future SearchFilter(String jobtitle,String location,String salary,context)async{
    Dio dio =Dio();
    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer ${Provider.of<RegisterLogin>(context,listen: false).token} ";

    String urlpost="https://project2.amit-learning.com/api/jobs/filter?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";

    final data={
      "name":jobtitle,
      "location":location,
      "salary":salary
    };
    Response response=await dio.post(urlpost,data: data);
    if(response.statusCode==200){
      final body=response.data;
      // Navigator.of(context).pushNamedAndRemoveUntil("mianhome", (route) => false);
      // token=response.data['token'] ;
      List<Map<String,dynamic>> dataa=[];
      dataa=response.data['data']['name'];
      namee=body['data'];
      return body;
    }
    else {
      return null!;
    }
  }notifyListeners();


  //moving between locatio of work
  int select=0;
  ChangeSatate(index){
    select=index;
    notifyListeners();
  }

  //moving between job type

  int selection=0;
  ChangeState(indexx){
    selection=indexx;
    notifyListeners();
  }
}