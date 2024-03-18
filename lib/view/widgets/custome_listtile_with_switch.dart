import 'package:firbase/controller/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomeListTileSwitch extends StatefulWidget {
   CustomeListTileSwitch({super.key,this.title});
  String? title;

  @override
  State<CustomeListTileSwitch> createState() => _CustomeListTileSwitchState();
}

class _CustomeListTileSwitchState extends State<CustomeListTileSwitch> {
  bool switchh=false;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text("${widget.title}",style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Switch(
        activeTrackColor: Colors.black,
        activeColor: Colors.red,
        value: switchh, onChanged: (value) {
        setState(() {
          switchh=value;
        });
      },),);
  }
}
