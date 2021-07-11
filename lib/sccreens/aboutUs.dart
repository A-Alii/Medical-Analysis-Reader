import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import 'package:mar/Components/mydrawer.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/sccreens/knowAnalysis.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'infoAnalysis.dart';
import 'login_screen.dart';

class About extends StatefulWidget {
  static String id='About';
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  int _bottomBarIndex = 0;
  final _auth = Auth();
  VoiceController _voiceController;
  String text = "Medical Analysis Reader It is a medical app that provides a service for patients who makes medical examinations and want to know the results of their medical analyses and diagnose the symptoms present in an analysis. Initially, the user allows the application to take pictures and scans the analysis, then the App outputs are the results of the analysis the application also contains many other services where the application provides a service to find the nearest medical laboratory. When the user allows the program to know its location, the program scans all laboratories near the user’s location and identifies the closest laboratory to him. There are also other services in the application, such as determining the appropriate analysis. When the user identifies the symptoms he feels, the program selects the appropriate analysis to diagnose his condition.";

  @override
  void initState() {
    _voiceController = FlutterTextToSpeech.instance.voiceController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _voiceController.stop();
  }

  _playVoice() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text,
        VoiceControllerOptions(),
      );
    });
  }

  _stopVoice() {
    _voiceController.stop();
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text("About Us", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 0, top: 30, right: 30, left: 30),
            child: Center(
              child: Text(
                "M.A.R",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Divider(
            color: kMainColor,
            endIndent: 150,
            height: 50,
            indent: 150,
            thickness: 2,
          ),
          Container(
            padding: EdgeInsets.only(top: 0, left: 30, right: 30),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(text, style: TextStyle(fontSize: 18),),
                      Divider(
                        thickness: 3,
                        color: kMainColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(icon: Icon(Icons.play_circle_outline), onPressed: _playVoice)
                            ],
                          ),

                          Column(
                            children: [
                              IconButton(icon: Icon(Icons.stop_circle_outlined), onPressed: _stopVoice)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      //child: Text(" M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company.",
      //style: TextStyle(fontSize: 25,),

      //padding: EdgeInsets.all(20.0),
      //Navigation
      /*bottomNavigationBar: BottomNavigationBar(
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
          if (value == 1) {
            Navigator.pushNamed(context, Information.id);
          }
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
      ),*/
    );
  }
}
