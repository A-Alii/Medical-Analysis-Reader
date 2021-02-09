import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/Components/mydrawer.dart';
import 'package:medical/Pages/charts/Compare_Analysis_charts.dart';
import 'package:medical/Pages/compare_files/Analysis.dart';
import 'package:medical/Pages/compare_files/MultiSelectionExample.dart';
import 'package:medical/Pages/compare_files/SingleSelectionExample.dart';

class Compare extends StatefulWidget {
  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  @override
  List<String> sortFilter = [
    ' CBC ',
    ' PCR ',
    ' Urine Analysis ',
    ' Glucose Test '
  ];

  List<Analysis> analysisList = [
    Analysis(' CBC2019-3-7 '),
    Analysis('CBC2019-3-22'),
    Analysis('CBC2019-4-12'),
    Analysis('CBC2019-9-24'),
    Analysis('CBC2020-7-2')
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        title: Text("Compare Analysis"),
        centerTitle: true,
      ),

      drawer: MyDrawer(),
      body: SingleSelectionExample(sortFilter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
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

  void openDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('List'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CompareAnalysisCharts()),
                  );
                },
                child: Text(
                  "Next",
                ),
              ),
              FlatButton(
                onPressed: () {
                  SingleSelectionExample(sortFilter);
                },
                child: Text(
                  "Cancel",
                ),
              ),
            ],
            content: Container(
                width: 300,
                height: 400,
                child: MultiSelectionExample(analysisList)),
          );
        });
  }
}
