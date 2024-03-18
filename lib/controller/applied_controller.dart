import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../model/JobModel.dart';
import '../view/screens/Home/Apllied/successful.dart';
import 'Register_login_controller.dart';


class ApliedController extends ChangeNotifier{
  //drobbutton
  String selected="Malysia";
  List jobs=[
    "Egypt",
    "Auc",
    "Malysia",
    "Suadi Arabia",
    "Brazile",
  ];

    ChangeState(valuee){
    selected=valuee;
    notifyListeners();
  }

  //radio check
  String? jobss;
  RadioChange(value){
    jobss=value;
    notifyListeners();
  }

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


  //pdf
  String? filename;
  String? urlpdf;

  Future UploadPdf(String filename,File file)async{
    var uploadfiles=FirebaseStorage.instance.ref().child("pdfs/$filename.pdf");
    final uploadTask=uploadfiles.putFile(file);
    await uploadTask.whenComplete(() => {});
    urlpdf=await uploadfiles.getDownloadURL();

    return urlpdf;
  }

  pickfile()async{
    final getpdf=await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf']
    );
    if(getpdf!=null){
      filename=getpdf.files[0].name;
      File file=File(getpdf.files[0].path!);

      final urlpdf=await UploadPdf(filename!, file);

    }
  }

  //add data
  TextEditingController fullname=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  String? jobtype;
  GlobalKey<ScaffoldState> keyapply=GlobalKey();

  //Firebase
  // CollectionReference employee=FirebaseFirestore.instance.collection("Employess");
  //
  // AddData()async{
  //   await employee.add({
  //     "id":FirebaseAuth.instance.currentUser!.uid,
  //     "name":fullname.text,
  //     "email":email.text,
  //     "phone":phone.text,
  //     "filename":filename,
  //     "url":urlpdf,
  //   });
  //   notifyListeners();
  // }

  Future<String> senddataApply(String urlpdff,String fullnameapplied,emailapplied,phoneapplied,jobtypeapplied,context)async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] ="Bearer ${Provider.of<RegisterLogin>(context,listen: false).token}";
    String urlpost = "https://project2.amit-learning.com/api/apply?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";

    final data = {
      "cv_file": urlpdff,
      "name": fullnameapplied,
      "email": emailapplied,
      "mobile": phoneapplied,
      "work_type": jobtypeapplied,
    };
    Response response = await dio.post(urlpost, data: data);
    if (response.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Sucess(),));
      return response.data;
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is error"),
      elevation: 20,
      duration: Duration(seconds: 3),));
      return null!;
    }
  }


//   //images
//
//   String? urlimage;
//
//   File? file;
//   gettimage()async{
//     final ImagePicker picker = ImagePicker();
// // Pick an image.
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//
//     // Capture a photo.
//     // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
//     file=File(image!.path);
//
//     var imagename=basename(image!.path);
//
//     var refimage=FirebaseStorage.instance.ref("images/$imagename");
//     await refimage.putFile(file!);
//     urlimage=await refimage.getDownloadURL();
//     notifyListeners();
//
//     // setstate(){} important to show image
//   }
}