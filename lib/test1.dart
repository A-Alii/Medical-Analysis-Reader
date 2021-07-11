import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestImage extends StatefulWidget {
  @override
  _TestImageState createState() => _TestImageState();
}

class _TestImageState extends State<TestImage> {
  String image = '';
  Future getImage () async{

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Image(image: NetworkImage(image)),


            /*Text(image, //Text that will be displayed on the screen
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),*/
            Center(
              child: Container( //container that contains the button
                width: 150,
                height: 60,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () async { //async function to perform http get

                    final response = await http.get('http://10.0.2.2:5000/image'); //getting the response from our backend server script

                    final decoded = json.decode(response.body) as Map<String, dynamic>; //converting it from json to key value pair

                    setState(() {
                      image = decoded['imageName']; //changing the state of our widget on data update
                      print("image is: $image");
                    });

                  },
                  child: Text(
                    'Press',
                    style: TextStyle(fontSize: 24,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}