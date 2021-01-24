import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:medical/Components/mydrawer.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}



class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
    top: true,
      child: new Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: (){},
            )
          ],
          title: Text("Notes on analysis"),
          centerTitle: true,
        ),
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
        body: Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Column(
            children: [
              Expanded(child: _buildList(),
              ),

            ],
          ),
        ),
        ),

      );
  }



  Widget _buildList() {
    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (context, i) {
        return new ExpansionTile(
          title: new Text(vehicles[i].title, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
          children: <Widget>[
            new Column(
              children: _buildExpandableContent(vehicles[i]),
            ),
          ],
        );
      },
    );
  }



  _buildExpandableContent(Vehicle vehicle) {
    List<Widget> columnContent = [];

    for (String content in vehicle.contents)
      columnContent.add(
        new ListTile(
          title: new Text(content, style: new TextStyle(fontSize: 18.0), ),
          leading: new IconButton(icon: Icon(vehicle.icon), onPressed: (){}),
        ),
      );

    return columnContent;
  }
}

class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon );
}

List<Vehicle> vehicles = [
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
];


// class _NotesState extends State<Notes> {
//   List<Item> _items = <Item>[
//     Item(header: "  Haematocrit", body: "Body0"),
//     Item(header: "  MCV", body: "Body1"),
//     Item(header: "  Haemoglobin", body: "Body3"),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return _buildPage();
//   }
//
//   Widget _buildPage() {
//     return SafeArea(
//       top: true,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {},
//             )
//           ],
//           title: Text("Notes on analysis"),
//           centerTitle: true,
//         ),
//         // drawer: MyDrawer(),
//
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.camera_alt,
//               ),
//               title: Text('Scan'),
//               backgroundColor: Colors.blue,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.location_pin,
//               ),
//               title: Text('Nearesrt'),
//               backgroundColor: Colors.blue,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.open_in_new_outlined,
//               ),
//               title: Text('compare'),
//               backgroundColor: Colors.blue,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.feedback,
//               ),
//               title: Text('feedback'),
//               backgroundColor: Colors.blue,
//             ),
//           ],
//         ),
//
//         body: Padding(
//           padding: EdgeInsets.only(top: 25.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               // Spacer(),
//               Expanded(
//                 child: _buildList(),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildList() {
//     return ListView(
//       children: <Widget>[
//         ExpansionPanelList(
//           expansionCallback: (int index, bool isExtended) {
//             setState(() {
//               _items[index].isExpanded = !_items[index].isExpanded;
//             });
//           },
//           children: _items.map((Item item) {
//             return ExpansionPanel(
//               headerBuilder: (BuildContext context, bool isExpanded) {
//                 return Text(item.header);
//               },
//               isExpanded: item.isExpanded,
//               body: Container(color: Colors.white, child: Text(item.body)),
//             );
//           }).toList(),
//         ),
//         IconButton(
//           icon: Icon(Icons.volume_up),
//           onPressed: () {},
//         ),
//         const Divider(
//           color: Colors.grey,
//           height: 40,
//           thickness: 2,
//           indent: 40,
//           endIndent: 40,
//         ),
//         new Container(
//           margin: const EdgeInsets.symmetric(horizontal: 20.0),
//           padding: const EdgeInsets.all(5.0),
//           decoration:
//               BoxDecoration(border: Border.all(color: Colors.blueAccent)),
//           child: Text(
//             "Analyzes required",
//             style: TextStyle(
//               fontSize: 15.0,
//             ),
//           ),
//         ),
//         new Container(
//           margin: const EdgeInsets.all(15.0),
//           padding: const EdgeInsets.all(3.0),
//           decoration:
//               BoxDecoration(border: Border.all(color: Colors.blueAccent)),
//           child: Text(
//             "Dr Recommanded",
//             style: TextStyle(
//               fontSize: 15.0,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class Item {
//   Item({this.body, this.header, this.isExpanded = false});
//
//   final String body;
//   final String header;
//   bool isExpanded;
// }
