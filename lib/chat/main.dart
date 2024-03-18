//
// import 'package:firbase/chat/pages/chatpage.dart';
// import 'package:firbase/chat/pages/login_page.dart';
// import 'package:firbase/chat/pages/register_pade.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(ScolarApp());
// }
//
// class ScolarApp extends StatelessWidget {
//   const ScolarApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowMaterialGrid: false,
//       debugShowCheckedModeBanner: false,
//       routes: {
//        LoginPage.id:(context)=>LoginPage(),
//         RegsiterPage.id: (context) => RegsiterPage(),
//         Chat.chat_id:(context)=>Chat(),
//       },
//      initialRoute: LoginPage.id,
//     );
//   }
// }
// //mostafamahmoud@gmail.com
// //123456789