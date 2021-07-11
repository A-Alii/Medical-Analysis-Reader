import 'package:mar/Services/auth.dart';
import 'package:mar/sccreens/feedback.dart';
import 'package:mar/sccreens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var username;
  var email;
  var id;
  bool isSignIn = false;
  final _auth = Auth();
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
      email = preferences.getString("email");
      id = preferences.getString("UserId");
    });

    if (email != null) {
      setState(() {
        username = preferences.getString("username");
        email = preferences.getString("email");
        id = preferences.getString("UserId");
        isSignIn = true;
      });
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are You Sure?'),
            content: Text('You are going to exit the application !'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('NO'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Center(
            child: UserAccountsDrawerHeader(
              accountEmail: isSignIn ? Text(email) : Text(""),
              accountName: isSignIn ? Text(username) : Text(""),
              currentAccountPicture: CircleAvatar(
                child: Image(
                  image: AssetImage('images/icons/medical.png'),
                ),
                backgroundColor: kMainColor,
              ),
              decoration: BoxDecoration(
                  color: kMainColor,
                  image: DecorationImage(
                      image: AssetImage("images/image/ggh.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          ListTile(
            title: Text("Scan Analysis", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.camera_alt,
              color: kMainColor,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Scan');
            },
          ),
          ListTile(
            title: Text("Analysis Information ",
                style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.perm_device_information,
              color: kMainColor,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Information');
            },
          ),

          ListTile(
            title: Text("Know Sympotms of disease",
                style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.open_in_new_outlined,
              color: kMainColor,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Diseases');
            },
          ),


          ListTile(
            title: Text("Nearest Lab", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.location_pin,
              color: kMainColor,
            ),
            onTap: () {
              openurl();
            },
          ),
         /* ListTile(
            title:
            Text("Compare Analysis", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.bar_chart,
              color: kMainColor,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Compare');
            },
          ),*/
          Divider(
            color: kMainColor,
            endIndent: 48,
            thickness: 1.2,
            height: 20,
            indent: 48,
          ),
          ListTile(
            title: Text("Feedback", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.feedback_outlined,
              color: kMainColor,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Feedback1');
            },
          ),


          ListTile(
            title: Text("About Us", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.info_outline,
              color: kMainColor,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('About');
            },
          ),
          ListTile(
            title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.edit,
              color: kMainColor,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Edit');
            },
          ),

          ListTile(
            title: Text("Log Of", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.logout,
              color: kMainColor,
            ),
            onTap: () async {
              SharedPreferences pref =
              await SharedPreferences.getInstance();
              pref.remove("username");
              pref.remove("email");
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => LogIn()),
              );
            },
          )
        ],
      ),
    );

    // endDrawer for Arabic
    //endDrawer: Drawer(),
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