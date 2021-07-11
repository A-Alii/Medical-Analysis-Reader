import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mar/Services/auth.dart';
import 'package:mar/Components/myDrawer.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:mar/sccreens/select_diseases_for_inform.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import 'login_screen.dart';

class Information extends StatefulWidget {
  static String id = 'Information';
  @override
  _Informationtate createState() => _Informationtate();
}

class _Informationtate extends State<Information> {
  List analysis = [];
  List filteredanalysis = [];
  int _bottomBarIndex = 0;
  int currentIndex = 1;
  final _auth = Auth();
  Future<Null> showMoreInfo(
      BuildContext context, String value3, String value4, String value5) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Positioned(
                  right: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: kSecondaryColor,
                        child: Icon(Icons.close, color: kMainColor),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Text(
                        '$value3',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: kMainColor,
                        endIndent: 40,
                        height: 20,
                        indent: 40,
                        thickness: 1.2,
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Text('$value4'),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: kMainColor,
                                child: Text(
                                  "Nearest lab",
                                  style: TextStyle(color: kSecondaryColor),
                                ),
                                onPressed: () {
                                  openurl();
                                },
                              ),

                            ],
                          ),
                          Column(
                            children: [
                              ButtonBar(
                                children: [
                                  FlatButton.icon(
                                    icon: Icon(
                                      Icons.language,
                                      color: kMainColor,
                                    ),
                                    label: Text(
                                      'open in web',
                                      style: TextStyle(
                                        color: kMainColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _launched = _launchInWebViewOrVC('$value5');
                                      });
                                    },
                                  )
                                ],
                              ),
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
        );
      },
    );
  }

  Future fetchdata() async {
    var res = await http.get("http://10.0.2.2/medical/AnalysisInfo.php");
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj;
    }
  }

  bool isSearching = false;

  @override
  void initState() {
    fetchdata().then((data) {
      setState(() {
        analysis = filteredanalysis = data;
      });
    });
    super.initState();
  }

  void _filteranalysis(value) {
    setState(() {
      filteredanalysis = analysis
          .where((country) =>
          country['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Future<void> _launched;

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        actions: <Widget>[
          isSearching
              ? IconButton(
            icon: Icon(
              Icons.cancel,
              color: kSecondaryColor,
            ),
            onPressed: () {
              setState(() {
                this.isSearching = false;
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                this.isSearching = true;
              });
            },
          ),
        ],
        title: !isSearching
            ? Text(
          "Analysis Information",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
            : TextField(
          onChanged: (value) {
            _filteranalysis(value);
          },
          style: TextStyle(color: kSecondaryColor),
          decoration: InputDecoration(
              hintText: "Serach For Analysis here...",
              icon: Icon(
                Icons.search,
                color: kSecondaryColor,
              ),
              hintStyle: TextStyle(color: kSecondaryColor)),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: filteredanalysis.length > 0
            ? ListView.builder(
          itemBuilder: (_, index) {
            return Container(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.medical_services_outlined),
                      backgroundColor: kSecondaryColor,
                      foregroundColor: kMainColor,
                    ),
                    title: Text(
                      "${filteredanalysis[index]['name']}",
                      style: TextStyle(fontSize: 22.0),
                    ),
                    onTap: () {
                      showMoreInfo(
                          context,
                          '${filteredanalysis[index]['name']}',
                          '${filteredanalysis[index]['details']}',
                          '${filteredanalysis[index]['url']}');
                    },
                  ),
                ],
              ),
            );
          },
          itemCount: filteredanalysis.length,
        )
            : Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(

          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Your Search For Analysis Not Found", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kMainColor,),),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.error_outline_sharp, color: kMainColor,)
                    ],
                  ),
                ],
              ),
          ),
        ),
            )
      ),
      bottomNavigationBar: BottomNavyBar(
        animationDuration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        selectedIndex: currentIndex,
        onItemSelected: (index) async {
          if (index == 0) {
            Navigator.pushNamed(context, Scan.id);
          }
          if (index == 1) {
            Navigator.pushNamed(context, Information.id);
          }
          if (index == 2) {
            Navigator.pushNamed(context, Diseases.id);
          }
          if (index == 3) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.clear();
            await _auth.signOut();
            Navigator.popAndPushNamed(context, LoginScreen.id);
          }
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(
              Icons.camera_alt,
            ),
            title: Text('Scan'),
            activeColor: kMainColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.perm_device_information,
            ),
            title: Text('Information'),
            activeColor: kMainColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.open_in_new_outlined,
            ),
            title: Text('Know analysis'),
            activeColor: kMainColor,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

openurl() async {
  const url1 =
      'https://www.google.com/maps/search/?api=1&query=medical+laboratory';
  if (await canLaunch(url1)) {
    await launch(url1);
  } else {
    throw 'Could not launch $url1';
  }
}