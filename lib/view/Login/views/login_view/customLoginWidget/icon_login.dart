
import 'package:flutter/material.dart';

import '../../../const/consts.dart';


class IconLogin extends StatelessWidget {
  const IconLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    child:  Image(image: AssetImage("images/Logo.png"),height:19 ,width: 81,),);
    //   height: 19,
    //   width: 81,
    //   child:const Text(
    //     "J    BSQUE",
    //     style: TextStyle(
    //         color: Colors.black,
    //         fontFamily: kPrimaryfont,
    //         fontWeight: FontWeight.w700,
    //         fontSize: 16),
    //   ),
    // );
  }
}

