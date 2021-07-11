import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mar/Components/mydrawer.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/provider/modalHud.dart';
import 'package:mar/sccreens/knowAnalysis.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:mar/widgets/custom_logo.dart';
import 'package:mar/widgets/custom_logo_feedback.dart';
import 'package:mar/widgets/custom_textfiled.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


import '../constants.dart';
import 'infoAnalysis.dart';
import 'login_screen.dart';

class Feedback extends StatefulWidget {

  static String id = 'Feedback';
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  TextEditingController _feedbackSubject=new TextEditingController();
  TextEditingController _feedbackBody=new TextEditingController();


  Future<List> senddata() async {
    final response = await http.post("http://10.0.2.2/medical/feedback.php", body: {
      "feedbackSubject": _feedbackSubject.text,
      "feedbackBody": _feedbackBody.text,
    });
  }

  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  String _email,_password;
  int _bottomBarIndex = 0;
  final _auth = Auth();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        actions: <Widget>[
          FlatButton(
            child: CircleAvatar(
              child: Image(
                image: AssetImage('images/icons/medical.png'),
              ),
              backgroundColor: Colors.black,
            ),
            onPressed: ()
            {
              Navigator.pushNamed(context, Scan.id);
            },
          ),
        ],
        title: Text("Feedback", style: TextStyle(fontFamily: 'Pacifico',),),
        centerTitle: true,
      ),

      drawer: MyDrawer(),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              Custom_Logo_Feedback(),
              SizedBox(
                height: height*.02,
              ),
              buildFeedbackSubject(),
              SizedBox(
                height: height*.02,
              ),
              buildFeedbackForm(),
              SizedBox(
                height: height*.05,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 140),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {},
                        color: kMainColor,
                        //padding: EdgeInsets.all(16.0),
                        child: Text("Send",

                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height*.04,
              ),
            ],
          ),
        ),
      ),


      //Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: kUnActiveColor,
        currentIndex: _bottomBarIndex,
        fixedColor: kMainColor,
        onTap: (value) async {
          if (value == 3) {
            SharedPreferences pref =
            await SharedPreferences.getInstance();
            pref.clear();
            await _auth.signOut();
            Navigator.popAndPushNamed(context, LoginScreen.id);
          }
          setState(() {
            _bottomBarIndex = value;
          });
          if (value == 1) {
            Navigator.pushNamed(context, Information.id);
          }
          setState(() {
            _bottomBarIndex = value;
          });
          if (value == 2) {
            Navigator.pushNamed(context, Know.id);
          }
          if (value == 0) {
            Navigator.pushNamed(context, Scan.id);
          }
          setState(() {
            _bottomBarIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
            ),
            title: Text('Scan'),
            backgroundColor: kMainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_device_information,
            ),
            title: Text('Information'),
            backgroundColor: kMainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.open_in_new_outlined,
            ),
            title: Text('Know analysis'),
            backgroundColor: kMainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.logout,
            ),
            title: Text('LogOf'),
            backgroundColor: kMainColor,
          ),
        ],
      ),
    );
  }
}

buildFeedbackSubject() {
  return Container(
    height: 100.0,
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "subject of the issue",
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: kMainColor,

              ),
              prefixIcon: Icon(
                Icons.subject,
                color: kMainColor,
              ),
              filled: true,
              fillColor: kSecondaryColor,

              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(

                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

buildFeedbackForm() {
  return Container(
    height: 200.0,
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: kMainColor,
              ),
              prefixIcon: Icon(
                Icons.analytics_outlined,
                color: kMainColor,
              ),
              filled: true,
              fillColor: kSecondaryColor,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(

                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),

  );
}
