import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../view/screens/profile/settings/Login and security/verification/entercode.dart';
import 'Register_login_controller.dart';

class ProfileController extends ChangeNotifier{

  //images
  String? urlimage;
  File? file;
  gettimage()async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    file=File(image!.path);

    var imagename=basename(image!.path);

    var refimage=FirebaseStorage.instance.ref("images/$imagename");
    await refimage.putFile(file!);
    urlimage=await refimage.getDownloadURL();
    notifyListeners();

    // setstate(){} important to show image
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

    }notifyListeners();
  }

  //send portfolio
  Dio dio = Dio();
  Future<String> SendPortfolio(String pdffilen,context)async {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] ="Bearer ${Provider.of<RegisterLogin>(context,listen: false).token}";
    String urlpost = "https://project2.amit-learning.com/api/user/profile/portofolios?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";

    final data = {
      "cv_file":pdffilen
    };
    Response response = await dio.post(urlpost, data: data);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Pdf sended"),
        elevation: 20,
        duration: Duration(seconds: 3),));
      return response.data;
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is error"),
        elevation: 20,
        duration: Duration(seconds: 3),));
      return null!;
    }
  }

  //email
  String? emailr,emaill;

  //radio
  // bool state=false;
  // ChangeState(value){
  //   if(value==true){
  //     state=true;
  //   }
  //   else{
  //     state=false;
  //   }
  //   notifyListeners();
  // }

  //senddata
  String? coode;

  Future<String> SendCode(String email,context)async {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] ="Bearer ${Provider.of<RegisterLogin>(context,listen: false).token}";
    String urlpost = "https://project2.amit-learning.com/api/auth/otp?api_key=4157|3b0ASyYS9hAKODs258AHX8lQkw0Szz37LQas6J3W";

    final data = {
      "email":email
    };
    Response response = await dio.post(urlpost, data: data);
    if (response.statusCode == 200) {

      final body=response.data;
    coode=response.data['data'] ;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("code sended"),
        elevation: 20,
        duration: Duration(seconds: 5),));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => EnterCode(),));
      return coode.toString();
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is error"),
        elevation: 20,
        duration: Duration(seconds: 3),));
      return null!;
    }
  }


}