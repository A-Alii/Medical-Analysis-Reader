import 'dart:convert';
import 'dart:math';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mar/Components/myDrawer.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/constants.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'infoAnalysis.dart';
import 'login_screen.dart';

class Diseases extends StatefulWidget {
  static String id = 'Diseases';
  @override
  _DiseasesState createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  bool _inProcess = false;

  int _bottomBarIndex = 0;

  final _auth = Auth();
  int currentTab = 0;
  int currentIndex = 2;

  String selectedvalue;
  List diseasesName = List();

  Future getAllDiseases() async {
    var url = "http://10.0.2.2/medical/diseases.php";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        diseasesName = jsonData;
      });
    }
    print(diseasesName);
  }

  Future getSympotmsByDiseases() async {
    var url = "http://10.0.2.2/medical/symptoms.php";
    var response = await http.post(url, body: {"diseases_Name": selectedvalue});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData;
    }
  }

  @override
  void initState() {
    super.initState();
    getAllDiseases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Know Sympotms of disease",
          style: TextStyle(fontWeight: FontWeight.bold,),
        ),
        backgroundColor: kMainColor,
      ),
      drawer: MyDrawer(),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
              child: DropdownButton(
                isExpanded: true,
                hint: Text("Select Disease", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kMainColor)),
                value: selectedvalue,
                items: diseasesName.map((category) {
                  return DropdownMenuItem(
                    value: category['DiseasesName'],
                    child: Text(category['DiseasesName'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kMainColor)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedvalue = value;
                  });
                },
              ),
            ),
            //Text(selectedvalue),
            selectedvalue != null
                ? Container(
              height: 400,
              child: FutureBuilder(
                  future: getSympotmsByDiseases(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [

                                  Text("No Symptoms for this disease", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kMainColor)),
                                  Text(" Now Coming Soon!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kMainColor)),

                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.warning_amber_rounded, color: kMainColor,)
                                ],
                              )
                            ],
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            var list = snapshot.data[index];
                            return Card(
                              color: Colors.primaries[Random()
                                  .nextInt(Colors.primaries.length)],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Column(
                                    children: [
                                      Text('Disease : $selectedvalue'),
                                      Divider(
                                        endIndent: 2,
                                      ),
                                      Text(list['SymptomsName'],
                                          style: TextStyle(
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return Text('No Data Found!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kMainColor));
                  }),
            )
                : Text("Select diseases First", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: kMainColor)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        animationDuration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        selectedIndex: currentIndex,
        onItemSelected: (index) async {
          if (index == 3) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.clear();
            await _auth.signOut();
            Navigator.popAndPushNamed(context, LoginScreen.id);
          }
          setState(() {
            _bottomBarIndex = index;
          });
          if (index == 1) {
            Navigator.pushNamed(context, Information.id);
          }
          setState(() {
            _bottomBarIndex = index;
          });
          if (index == 2) {
            Navigator.pushNamed(context, Diseases.id);
          }
          if (index == 0) {
            Navigator.pushNamed(context, Scan.id);
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