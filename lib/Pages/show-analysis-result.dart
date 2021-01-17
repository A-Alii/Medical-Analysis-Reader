import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/Pages/notes-on-analysis.dart';

import 'notes-on-analysis.dart';

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
            "Test Results",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          
        ),
        Divider(
          color: Colors.blue,
          height: 5,
          endIndent: 48,
          indent: 48,
          thickness: 1.2,
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
                    Icons.thumb_up,
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
                    Icons.thumb_down,
                    color: Colors.red,
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
                    Icons.thumb_up
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
                    Icons.thumb_down,
                    color: Colors.red,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              TableRow(children: [
                Text(
                  "Glucos",
                  textScaleFactor: 1.5,
                ),
                Text("172", textScaleFactor: 1.5),
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
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
                    Icons.thumb_down,
                    color: Colors.red,
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
                    Icons.thumb_up,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ]),
              
            ],
          ),
        ),
        Divider(
          color: Colors.blue,
          height: 40,
          endIndent: 40,
          indent: 40,
          thickness: 1.2,
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.volume_up,color: Colors.blue,size: 40,),
                onPressed: () {
                  
                },
              ),
              IconButton(
                icon: Icon(Icons.event_note,color: Colors.blue,size: 30,),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notes()));
                },
              ),
            ],
          ),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text("Read Analysis",style: TextStyle(color: Colors.blue),),
              new Text("Notes      ",style: TextStyle(color: Colors.blue),)
            ],
          ),
        
      ]
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
