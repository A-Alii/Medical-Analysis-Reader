import 'package:flutter/material.dart';
import 'package:mar/sccreens/aboutUs.dart';
import 'package:mar/sccreens/analysisResult.dart';
import 'package:mar/sccreens/edit.dart';
import 'package:mar/sccreens/feedback.dart';
import 'package:mar/sccreens/infoAnalysis.dart';
import 'package:mar/sccreens/knowAnalysis.dart';
import 'package:mar/sccreens/login_screen.dart';
import 'package:mar/sccreens/nearestLab.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:mar/sccreens/select_diseases_for_inform.dart';
import 'package:mar/sccreens/signup_screen.dart';
import 'package:mar/sccreens/userfeedback.dart';
import 'Components/mySlider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Start Project

      // to remove water mark
      debugShowCheckedModeBanner: false,
      title: 'Medical Analysis',
      theme: ThemeData(
          textTheme: TextTheme(headline3: TextStyle(color: Colors.blue))),
      //initial route
      home: OnBoardingPage(),
      routes: {
        //OnBoardingPage.id: (context) => OnBoardingPage(),
        Scan.id: (context) => Scan(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        Information.id: (context) => Information(),
        Nearest.id: (context) => Nearest(),
        Diseases.id: (context) => Diseases(),
        Feedback1.id: (context) => Feedback1(),
        About.id: (context) => About(),
        Edit.id: (context) => Edit(),
      },
    );
  }
}
