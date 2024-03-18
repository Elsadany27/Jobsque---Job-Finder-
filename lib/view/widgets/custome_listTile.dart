import 'package:flutter/material.dart';

class CustomeListTile extends StatelessWidget {
   CustomeListTile({super.key,this.title,this.icon,required this.ontap,this.arrowicon});
  IconData? icon;
  IconData? arrowicon;
  String? title;
   final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("$title",style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: IconButton(icon:Icon(arrowicon),onPressed:ontap),
      leading: CircleAvatar(backgroundColor: Color(0xffD6E4FF),child: Icon(icon),radius: 20),
    );
  }
}
