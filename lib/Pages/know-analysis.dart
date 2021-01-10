import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:medical/Components/mybutton.dart';
import 'package:medical/Components/mydrawer.dart';
import 'package:medical/Pages/read-requirements.dart';

class Know extends StatefulWidget {
  @override
  _KnowState createState() => _KnowState();
}

class _KnowState extends State<Know> {
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        title: Text("Know Your Analysis"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Container(
        child: Center(
          child: MyButton(
                      title: "Read Requirements",
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReadReq()),
                        );
                      },
                      mdw: mdw,
                    ),
        ),
      ),
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
