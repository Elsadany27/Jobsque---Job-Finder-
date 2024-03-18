import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/applied_controller.dart';
import 'custome_button.dart';

class CV extends StatelessWidget {
  const CV({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApliedController>(
      builder: (context, provider, child) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(25),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.upload_file, size: 80),
                Text("Upload your other file",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),

                CustomeButton(ontap: () {
                  provider.pickfile();
                  if (provider.urlpdf != null)
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: 'Upload',
                      desc: 'Successful Upload',
                      btnOkOnPress: () {},
                    )
                      ..show();
                }, textt: "Upload Your CV",),

              ],),
          ),
        );
      },
    );
  }
}
