import 'package:firbase/controller/ProfileController.dart';
import 'package:firbase/controller/SearchController.dart';
import 'package:firbase/controller/home_controller.dart';
import 'package:firbase/services/google.dart';
import 'package:firbase/view/Login/provider/login_controller.dart';
import 'package:firbase/view/Login/views/forget_password_view/check_email_view.dart';
import 'package:firbase/view/Login/views/forget_password_view/create_new_password_view.dart';
import 'package:firbase/view/Login/views/forget_password_view/reset_view.dart';
import 'package:firbase/view/Login/views/login_view/loginView.dart';
import 'package:firbase/view/screens/Home/Apllied/Type_Of_Job.dart';
import 'package:firbase/view/screens/Home/Apllied/upload_portfolio.dart';
import 'package:firbase/view/screens/Home/Details_Screen.dart';
import 'package:firbase/view/screens/Home/Home_Screen.dart';
import 'package:firbase/view/screens/Home/Main_HomePage.dart';
import 'package:firbase/view/screens/Register/Register_Screen.dart';
import 'package:firbase/view/screens/Register/Thirt_screen.dart';
import 'package:firbase/view/screens/Register/second_register.dart';
import 'package:firbase/view/screens/Register/success_login.dart';
import 'package:firbase/view/screens/onboarding/onboarding_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat/pages/chatpage.dart';
import 'chat/pages/login_page.dart';
import 'chat/pages/register_pade.dart';
import 'controller/Details_controller.dart';
import 'controller/Register_login_controller.dart';
import 'controller/SavedController.dart';
import 'controller/applied_controller.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterLogin(),),
        ChangeNotifierProvider(create: (context) => HomeController(),),
        ChangeNotifierProvider(create: (context) => DetailsController(),),
        ChangeNotifierProvider(create: (context) => ApliedController(),),
        ChangeNotifierProvider(create: (context) => Login(),),
        ChangeNotifierProvider(create: (context) => SearchControllerr(),),
        ChangeNotifierProvider(create: (context) => SavedController(),),
        ChangeNotifierProvider(create: (context) => ProfileController(),),
        ChangeNotifierProvider(create: (context) => Services(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "register":(context) => Register(),
          "secondregister":(context) =>SecondRegister(),
          "thirtscreen":(context) => ThirtScreen(),
          "successpage":(context) => SucessLgin(),
          "home":(context) => HomePage(),
          "mianhome":(context) => MainHome(),
          "details":(context) => DetailsPage(),
          "login":(context) => LoginView(),
          "resetpassword":(context) => ResetPassword(),
          "checkmail":(context) => ChechEmailPage(),
          "create_new_password":(context) => CreateNewPasswordPage(),
          "Typeofjob":(context) => TypeOfJob(),
          "portfolio":(context) => Portfolio(),
          LoginPage.id:(context)=>LoginPage(),
          RegsiterPage.id: (context) => RegsiterPage(),
          Chat.chat_id:(context)=>Chat(),
        },
        home: Onboarding(),
      ),
    );
  }
}

// import 'package:firbase/chat/pages/chatpage.dart';
// import 'package:firbase/chat/pages/login_page.dart';
// import 'package:firbase/chat/pages/register_pade.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'chat/firebase_options.dart';
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
//         LoginPage.id:(context)=>LoginPage(),
//         RegsiterPage.id: (context) => RegsiterPage(),
//         Chat.chat_id:(context)=>Chat(),
//       },
//       initialRoute: LoginPage.id,
//     );
//   }
// }
// //mostafamahmoud@gmail.com
// //123456789