import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ReadReq extends StatefulWidget {
  @override
  _ReadReqState createState() => _ReadReqState();
}

class _ReadReqState extends State<ReadReq> {
  Future getData() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    var responce = await http.get(url);
    var responcebody = jsonDecode(responce.body);
    return responcebody;

  }


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
      body: FutureBuilder(
        future: getData(),
        
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData){
            
               return Container(child: Text(snapshot.data[1]['body'], style: TextStyle(color: Colors.pink, fontSize: 22.0, fontStyle: FontStyle.normal,),));
              
          }
          return CircularProgressIndicator();
        },
        
      ),
      //

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

