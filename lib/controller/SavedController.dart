import 'package:dio/dio.dart';
import 'package:firbase/model/SavedModel.dart';
import 'package:firbase/view/screens/save%20&%20Notification/saved/saved.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Register_login_controller.dart';

class SavedController extends ChangeNotifier{
  int? jobId;

  //saved
  Dio dio =Dio();
  Future SavedJob(context)async{

    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer ${Provider.of<RegisterLogin>(context,listen: false).token} ";

    String urlpost="https://project2.amit-learning.com/api/favorites?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";

    final data={
      "job_id":jobId,
    };
    Response response=await dio.post(urlpost,data: data);
    if(response.statusCode==200){
      final body=response.data;
      // Navigator.of(context).pushNamedAndRemoveUntil("mianhome", (route) => false);
      // token=response.data['token'] ;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Job is saved",style: TextStyle(color: Colors.black)),
      duration: Duration(seconds: 3),
      elevation: 25,
      showCloseIcon: true,
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(width: 2,color: Colors.black)),));
      return body;
    }
    else {
      return null!;
    }
  }notifyListeners();

  //get data
  String url="https://project2.amit-learning.com/api/favorites?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";
  Future<SavedData> getdata(context)async{

    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer ${Provider.of<RegisterLogin>(context,listen: false).token}";

    Response response=await dio.get(url);
    print("\nBody ${response.data} stutus ${response.statusCode}");

    return SavedData.fromJson(response.data);
  }

  //delete saved job
  Future deletejob(context)async{

    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer ${Provider.of<RegisterLogin>(context,listen: false).token} ";

    String urldelete="https://project2.amit-learning.com/api/favorites/1?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";
    Response response=await dio.delete(urldelete);
    if(response.statusCode==200){
      final body=response.data;
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SavedPage(),));
      return body;
    }
    else {
      return null!;
    }
  }



}