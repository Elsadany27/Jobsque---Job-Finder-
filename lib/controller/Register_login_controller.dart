import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterLogin extends ChangeNotifier{
  bool stste=true;
  // Color color=Colors.white;
  int? select;
  String? username,usernamel,password;



  //visible password
  ChangState(){
    if(stste==true){
      stste=false;
    }
    else{
      stste=true;
    }notifyListeners();
  }

  // ChangeColor(int indexx){
  //   indexx=select!;
  //   if(color==Colors.white && select!=indexx){
  //     color=Colors.blueAccent;
  //   }
  //   else{
  //     color=Colors.white;
  //   }notifyListeners();
  // }

  //loop
  //  ToggleButton(){
  //    for(int i=0;i<selected.length;i++){
  //      if(i==index){
  //        selected[i]=true;
  //      }
  //      else{
  //        selected[i]=false;
  //      }
  //    }
  //  }
  //get username
  chexkname() {
    if (username == null) {
      return "error";
    }
    else {
      return username;
    }
  }

  //send data register

  String? token;

  Future<String> senddata(String name,String email,String password,context)async{
    Dio dio =Dio();
    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer 4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W ";

    String urlpost="https://project2.amit-learning.com/api/auth/register?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";

    final data={
      "name":name,
      "email":email,
      "password":password
    };
    Response response=await dio.post(urlpost,data: data);
    if(response.statusCode==200){
      final body=response.data;
      token=response.data['token'] ;
      Navigator.of(context).pushNamed("secondregister");
      return token.toString();
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is error in email or password")));
      return null!;
    }
  }notifyListeners();

  //change password

  Future<String> changepassword(String name,String password,context)async{
    Dio dio =Dio();
    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer $token";

    String urlpost="https://project2.amit-learning.com/api/auth/user/update?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";

    final data={
      "name":name,
      "password":password
    };
    Response response=await dio.post(urlpost,data: data);
    if(response.statusCode==200){
      final body=response.data;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password changed"),
        duration: Duration(seconds: 3),
        elevation: 25,));
      token=response.data['token'] ;
      notifyListeners();
      return token.toString();
    }
    else {
      return null!;
    }
  }

  //login
  Future<String> Login(String email,String password,context)async{
    Dio dio =Dio();
    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer $token ";

    String urlpost="https://project2.amit-learning.com/api/auth/login?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";

    final data={
      "email":email,
      "password":password
    };
    Response response=await dio.post(urlpost,data: data);
    if(response.statusCode==200){
      final body=response.data;
      Navigator.of(context).pushNamedAndRemoveUntil("mianhome", (route) => false);
      token=response.data['token'] ;
      return token.toString();
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is error in email or password")));
      return null!;
    }
  }



}

