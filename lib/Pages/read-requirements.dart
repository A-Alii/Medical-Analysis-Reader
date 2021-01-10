import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/Components/mydrawer.dart';

class ReadReq extends StatefulWidget {
  @override
  _ReadReqState createState() => _ReadReqState();
}

class _ReadReqState extends State<ReadReq> {
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
        title: Text("Requirements"),
        centerTitle: true,
      ),
      //drawer: MyDrawer(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.0, left: 10.0),
            child: Text(
              "CBC Test",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(
            color: Colors.blue,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
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
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
                      Text(
                          "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "search nearest lab",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
              ButtonBar(
                children: [
                  FlatButton.icon(
                    icon: Icon(Icons.open_in_new),
                    label: Text('open in webview'),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  )
                ],
              ),
            ],
          ),
        ],
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
