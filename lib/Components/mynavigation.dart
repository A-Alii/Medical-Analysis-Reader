import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Mynavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          items: <Widget>[
            Icon(Icons.camera, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),  
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.redAccent,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
        )
    );

  }}