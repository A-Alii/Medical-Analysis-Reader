import 'package:flutter/material.dart';
import 'package:medical/Pages/about-us.dart';
import 'package:medical/Pages/compare-analysis.dart';
import 'package:medical/Pages/feedback.dart';
import 'package:medical/Pages/information-analysis.dart';
import 'package:medical/Pages/know-analysis.dart';
import 'package:medical/Pages/nearest-lab.dart';
import 'package:medical/Pages/scan-anlysis.dart';
import 'package:medical/slider/sliderintro.dart';
import 'package:medical/Pages/forget-password.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: SliderIntro(),
      routes: {
        'Scan': (context) {
          return Scan();
        },
        'About': (context) {
          return About();
        },
        'Nearest': (context) {
          return Nearest();
        },
        'Compare': (context) {
          return Compare();
        },
        'Information': (context) {
          return Information();
        },
    'Forget': (context) {
    return ForgetPassword();},

        'Feedback': (context) {
          return Feedback1();
        },
        'Know': (context) {
          return Know();

        },
      },
      // End Project
    );
  }
}
