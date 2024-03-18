import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/login_controller.dart';


class CustomCheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Login>(
      builder: (context, checkboxModel, child) {
        return Checkbox(

          value: checkboxModel.isChecked,
          onChanged: (value) {
            checkboxModel.toggleCheckbox();
          },
        );
      },
    );
  }
}