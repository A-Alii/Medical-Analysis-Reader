import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Components/mydrawer.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
//  import 'package:search_map_place/search_map_place.dart';
import 'package:url_launcher/url_launcher.dart';
class Nearest extends StatefulWidget {
  static String id='Nearest';
  @override
  _NearestState createState() => _NearestState();
}

class _NearestState extends State<Nearest> {
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
        title: Text("Nearest Lab"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: RaisedButton(
        child: Text("Open Nearest Labs" ) , color: Colors.blueAccent,
        onPressed: (){openurl();},),

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

  openurl() async{
    const url1 ='https://www.google.com/maps/search/?api=1&query=medical+laboratory';
    if (await canLaunch(url1)) {
      await launch(url1);
    } else {
      throw 'Could not launch $url1';
    }
  }
}


// class _NearestState extends State<Nearest>{
//
//   Completer<GoogleMapController> _controller = Completer();
//   static const LatLng _center = const LatLng(45.521563, -122.677433);
//   final Set<Marker> _markers = {};
//   LatLng _lastMapPosition = _center;
//   MapType _cutrrentMapType = MapType.normal;
//
//   _onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }
//
//   _onCameraMove(CameraPosition position) {
//     _lastMapPosition = position.target;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 11.0,
//             ),
//             mapType: _cutrrentMapType,
//             markers: _markers,
//             onCameraMove: _onCameraMove,
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.camera_alt,
//             ),
//             title: Text('Scan'),
//             backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.location_pin,
//             ),
//             title: Text('Nearesrt'),
//             backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.open_in_new_outlined,
//             ),
//             title: Text('compare'),
//             backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.feedback,
//             ),
//             title: Text('feedback'),
//             backgroundColor: Colors.blue,
//           ),
//         ],
//       ),
//     );
//
//
//
//   }
//
//
// }