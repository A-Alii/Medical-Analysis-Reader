import 'package:flutter/material.dart';
import 'package:medical/Pages/login.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Pages/edit.dart';
import '../slider/sliderintro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var username;
  var email;
  bool isSignIn = false;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    username = preferences.getString("username");
    email = preferences.getString("email");

    if (username != null) {
      setState(() {
        username = preferences.getString("username");
        email = preferences.getString("email");
        isSignIn = true;
      });
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: isSignIn ? Text(email) : Text(""),
            accountName: isSignIn ? Text(username) : Text(""),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person_outline,
                size: 40,
                color: Colors.blue[500],
              ),
              backgroundColor: Colors.deepOrange.shade50,
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage("images/ggh.jpg"), fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text("Scan Analysis", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.camera_alt,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Scan');
            },
          ),
          ListTile(
            title: Text("Nearest Lab", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.location_pin,
              color: Colors.blue,
            ),
            onTap: () {
              openurl();
            },
          ),
          ListTile(
            title: Text("Know Your Analysis",
                style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.open_in_new_outlined,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Know');
            },
          ),
          ListTile(
            title:
                Text("Compare Analysis", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.bar_chart,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Compare');
            },
          ),
          ListTile(
            title: Text("Information Analysis",
                style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Information');
            },
          ),
          ListTile(
            title: Text("Feedback", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.feedback,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Feedback');
            },
          ),
          Divider(
            color: Colors.blue,
            endIndent: 48,
            thickness: 1.2,
            height: 20,
            indent: 48,
          ),
          ListTile(
            title: Text("About Us", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.info_outline,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('About');
            },
          ),
          ListTile(
            title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Edit()),
              );
            },
          ),
          isSignIn
              ? ListTile(
                  title: Text("Log Of", style: TextStyle(color: Colors.black)),
                  leading: Icon(
                    Icons.logout,
                    color: Colors.blue,
                  ),
                  onTap: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.remove("username");
                    preferences.remove("email");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                )
              : ListTile(
                  title: Text("Log In", style: TextStyle(color: Colors.black)),
                  leading: Icon(
                    Icons.login,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                ),
        ],
      ),
    );

    // endDrawer for Arabic
    //endDrawer: Drawer(),
  }

/*
    
 */

/*class MyDrawer extends StatelessWidget {
  var username ;
  var email ;
  @override
  Widget build(BuildContext context) {

  }
}*/
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
