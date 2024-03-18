import 'package:flutter/material.dart';

class Custome_appbarr extends StatelessWidget {
  const Custome_appbarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        const Image(
          image: AssetImage("images/Logo.png"),
          height: 19,
          width: 81,
        )
      ],
    );
  }
}
