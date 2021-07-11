import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Components/mydrawer.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/sccreens/readRequirements.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'infoAnalysis.dart';
import 'login_screen.dart';

class Know extends StatefulWidget {
  static String id='Know';
  @override
  _KnowState createState() => _KnowState();
}

class _KnowState extends State<Know> {
  int currentIndex = 2;
  Map<String, bool> numbers = {
    'One': false,
    'Two': false,
    'Three': false,
    'Four': false,
    'Five': false,
    'Six': false,
    'Seven': false,
    'w': false,
    'Twdwo': false,
    'wd': false,
    'wd': false,
    'qa': false,
    'Sixqwf': false,
    'wd': false,
  };
  var holder_1 = [];
  int _bottomBarIndex = 0;
  final _auth = Auth();
  getItems() {
    numbers.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }

  showdialogall(context, String mytitle, String mycontent) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Text(mytitle, style: TextStyle(color: Colors.deepOrange),),
            content: Text(mycontent),
            actions: [
              Center(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: kMainColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReadReq()),
                      );
                    },
                    child: Text(
                      "Requirements",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text("Know Your Analysis", style: TextStyle(fontFamily: 'Pacifico',),),
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
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: new Row(
              children: [
                Container(
                  child: FlatButton(
                      onPressed: () => {},
                      child: Icon(Icons.search, color: kSecondaryColor,)),
                ),
                Container(
                  height: 50,
                  width: 250,
                  child: new TextField(
                    cursorColor: kMainColor,
                    autocorrect: true,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      labelText: 'Search',
                      hintText: 'enter your diseas ',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(
                              color: kMainColor) //This is Ignored,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: numbers.keys.map((String key) {
                return new CheckboxListTile(
                  title: new Text(key),
                  value: numbers[key],
                  activeColor: kSecondaryColor,
                  checkColor: kMainColor,
                  onChanged: (bool value) {
                    setState(() {
                      numbers[key] = value;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              " Submit ",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: (){
              showdialogall(context, "Result !", "CBC Test");
            },
            // onPressed: showdialogall(context, "Result !", "CBC Test"),
            color: kMainColor,
            textColor: Colors.black,
            splashColor: kSecondaryColor,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
        ],
      ),

      //Navigation
      bottomNavigationBar: BottomNavyBar(
        animationDuration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        selectedIndex: currentIndex,
        onItemSelected: (index) async{
          if (index == 0) {
            Navigator.pushNamed(context, Scan.id);
          }
          if (index == 1) {
            Navigator.pushNamed(context, Information.id);
          }
          if (index == 2) {
            Navigator.pushNamed(context, Know.id);
          }
          if (index == 3) {
            SharedPreferences pref =
            await SharedPreferences.getInstance();
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
            inactiveColor: kSecondaryColor,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.perm_device_information,
            ),
            title: Text('Information'),
            activeColor: kMainColor,
            inactiveColor: kSecondaryColor,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.open_in_new_outlined,
            ),
            title: Text('Know analysis'),
            activeColor: kMainColor,
            inactiveColor: kSecondaryColor,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.logout,
            ),
            title: Text('LogOf'),
            activeColor: kMainColor,
            inactiveColor: kSecondaryColor,
          ),
        ],

      ),
    );
  }
}

