import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'infoAnalysis.dart';
import 'knowAnalysis.dart';
import 'login_screen.dart';

class Notes2 extends StatefulWidget {

  final Map<String, dynamic> dataNotes;

  Notes2({this.dataNotes});
  
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes2> {
  int _bottomBarIndex = 0;
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return new SafeArea();
    //top: true,
/*      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          actions: <Widget>[
            */ /*IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            )*/ /*
          ],
          title: Text("Notes on analysis", style: TextStyle(fontFamily: 'Pacifico'),),
          centerTitle: true,
        ),
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
       */ /* body: Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Column(
            children: [
              */ /**/ /*Expanded(child: _buildList(),*/ /**/ /*
              ),

            ],
          ),*/ /*
        ),
      ),

    );
  }*/


    /* Widget _buildList() {
    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (context, i) {
        return new ExpansionTile(
          title: new Text(vehicles[i].title, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
          children: <Widget>[
            new Column(
              children: _buildExpandableContent(vehicles[i]),
            ),
            Column(
              children: [
                Text(widget.dataNotes['aspect'])
              ],
            )
          ],
        );
      },
    );
  }*/


/*  _buildExpandableContent(Vehicle vehicle) {
    List<Widget> columnContent = [];

    for (String content in vehicle.contents)
      columnContent.add(
        new ListTile(
          title: new Text(content, style: new TextStyle(fontSize: 18.0), ),
          leading: new IconButton(icon: Icon(vehicle.icon), onPressed: (){}),
        ),
      );

    return columnContent;
  }*/
  }

/*class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon );
}*/

/*List<Vehicle> vehicles = [
  new Vehicle(
    'Heamatocrit',
    ['Body 0'],
    Icons.volume_up,
  ),
  new Vehicle(
    'MCV',
    ['Body 1'],
    Icons.volume_up,
  ),

  new Vehicle(
    'Haemoglobin',
    ['Body 3'],
    Icons.volume_up,
  ),

  new Vehicle(
    'Analyzes Required',
    ['Text'],
    Icons.volume_up,
  ),

  new Vehicle(
    'Dr Recommended',
    ['Text'],
    Icons.volume_up,
  ),
];*/
}
