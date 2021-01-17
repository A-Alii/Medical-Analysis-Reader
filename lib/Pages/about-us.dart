import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/Components/mydrawer.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        title: Text("About Us"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "M.A.R",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
            ),
            title: Text('Scan'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_pin,
            ),
            title: Text('Nearesrt'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.open_in_new_outlined,
            ),
            title: Text('compare'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.feedback,
            ),
            title: Text('feedback'),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
