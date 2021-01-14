import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalysisResult extends StatefulWidget {
  @override
  _AnalysisResultState createState() => _AnalysisResultState();
}

class _AnalysisResultState extends State<AnalysisResult> {
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
        title: Text("Show Analysis Result"),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Table",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            // textDirection: TextDirection.rtl,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(children: [
                Text(
                  "Glucos",
                  textScaleFactor: 1.5,
                ),
                Text("172", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.directions_transit,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              TableRow(children: [
                Text("Read Cells", textScaleFactor: 1.5),
                Text("6.3", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.person_add_disabled,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              TableRow(children: [
                Text("Voluem", textScaleFactor: 1.5),
                Text("200ml", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.directions_transit,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              TableRow(children: [
                Text("Byctriec", textScaleFactor: 1.5),
                Text("Null", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.directions_transit,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
            ],
          ),
        ),
      ]),
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
