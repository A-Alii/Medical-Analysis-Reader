import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mar/sccreens/loginpage.dart';
import 'package:mar/widgets/button_widget.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
  child: IntroductionScreen(
  pages: [
  PageViewModel(
  title: 'Featured Scan Analysis',
  body: 'You Can read Your Analysis and know detils about it.',
  image: buildImage('images/image/02.png'),
  decoration: getPageDecoration(),
  ),
  PageViewModel(
  title: 'Featured Analysis Information',
  body: 'You Can know informations about analysis.',
  image: buildImage('images/image/03.png'),
  decoration: getPageDecoration(),
  ),
  PageViewModel(
  title: 'Featured Diseases Symptoms',
  body: 'You can know the symptoms of the diseases you suspect.',
  image: buildImage('images/image/04.png'),
  decoration: getPageDecoration(),
  ),
  PageViewModel(
  title: 'Featured Nearest Labs',
  body: 'You can find nearest labs and doctors clinics ',
  footer: ButtonWidget(
  text: 'Start Reading',
  onClicked: () => goToHome(context),
  ),
  image: buildImage('images/image/06.png'),
  decoration: getPageDecoration(),
  ),
  ],
    done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
    onDone: () => goToHome(context),
    showSkipButton: true,
    skip: Text('Skip'),
    onSkip: () => goToHome(context),
    next: Icon(Icons.arrow_forward),
    dotsDecorator: getDotDecoration(),
    onChange: (index) => print('Page $index selected'),
    globalBackgroundColor: Theme.of(context).primaryColor,
    skipFlex: 0,
    nextFlex: 0,
    // isProgressTap: false,
    // isProgress: false,
    // showNextButton: false,
    // freeze: true,
    // animationDuration: 1000,
  ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => LogIn()),
  );
  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color(0xFFBDBDBD),
    //activeColor: Colors.orange,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.white,
  );
}
