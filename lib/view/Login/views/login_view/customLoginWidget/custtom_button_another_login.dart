
import 'package:flutter/material.dart';

import '../../../const/consts.dart';

class CustomAccountLoginButton extends StatelessWidget {
  CustomAccountLoginButton({
    required this.txt,
    this.image,
    super.key,
  });
  String? txt,image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 154,
        height: 46,
        decoration: BoxDecoration(
            color:const Color(0xffFFFF),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color:const Color(0xffD1D5DB))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [Image(image:AssetImage("${image}")),const SizedBox(width: 5,),
            Text("${txt}",style: const TextStyle(fontFamily: kPrimaryfont),)],
        ),
      ),
    );
  }
}
