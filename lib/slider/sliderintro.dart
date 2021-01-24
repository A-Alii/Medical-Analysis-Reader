import 'package:flutter/material.dart';
import 'package:medical/Components/mybutton.dart';
import 'package:medical/Pages/login.dart';
import 'package:medical/Pages/scan-anlysis.dart';

class SliderIntro extends StatefulWidget {
  @override
  _SliderIntroState createState() => _SliderIntroState();
}

class _SliderIntroState extends State<SliderIntro> {
  int currentpage = 0;

  List listintro = [
    {
      "text": "Welcome to M.A.R, Let's Scanning!",
      "image": "images/Png.png",
    },
    {
      "text": "Welcome to M.A.R, Let's Scanning!",
      "image": "images/Pngtr.png",
    },
    {
      "text": "Welcome to M.A.R, Let's Scanning!",
      "image": "images/Png.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (val) {
                    setState(() {
                      currentpage = val;
                    });
                  },
                  itemCount: listintro.length,
                  itemBuilder: (context, i) {
                    return TextAndImage(list: listintro[i], mdw: mdw);
                  },
                )),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(listintro.length,
                        (index) => buildcontrolpageview(index)),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  MyButton(
                    title: "Let's Start",
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                    mdw: mdw,
                  ),
                  MyButton(
                    title: "Skip",
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Scan()),
                      );
                    },
                    mdw: mdw,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// علشان الدايره تظهر لازم يكون الطول والعرض زى بعض والدايره تكون نصهم
  AnimatedContainer buildcontrolpageview(index) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 2),
      duration: Duration(milliseconds: 500),
      width: currentpage == index ? 20 : 5,
      height: 5,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            2.5,
          )),
    );
  }
}

class TextAndImage extends StatelessWidget {
  final list;
  final mdw;
  const TextAndImage({Key key, this.list, this.mdw}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: mdw / 7),
          child: Text(
            "M.A.R",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Text("${list['text']}"),
        ),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          "${list['image']}",
          width: mdw / 1.5,
        )
      ],
    ));
  }
}
