import 'package:flutter/material.dart';

import '../../../widgets/custom_sub_title.dart';
import '../../../widgets/custom_title_text.dart';

class TitleLogin extends StatelessWidget {
  const TitleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomTitle(txt: "Login"),
         SizedBox(
          height: 8,
        ),
        CustomSubTitle(txt: 'Please login to find  your dream job',)


      ],
    );
  }
}

