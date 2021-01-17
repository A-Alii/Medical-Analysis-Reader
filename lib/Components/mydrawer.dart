import 'package:flutter/material.dart';
import '../Pages/edit.dart';
import '../slider/sliderintro.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('ahmedali@gmail.com'),
            accountName: Text('Ahmed Ali'),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person_outline , size: 40,color: Colors.blue[500],),
            backgroundColor: Colors.deepOrange.shade50,
            ),
            
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage("images/ggh.jpg"),
                    fit: BoxFit.cover)),
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
              Navigator.of(context).pushNamed('Nearest');
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
          ListTile(
            title: Text("Log Of", style: TextStyle(color: Colors.black)),
            leading: Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SliderIntro()),
                      );
            },
          ),
        ],
      ),
    );
    // endDrawer for Arabic
    //endDrawer: Drawer(),
  }
}
