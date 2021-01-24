import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Future getData() async {
    var url = "http://10.0.2.2/analysis/users.php";
    var responce = await http.get(url);
    var responcebody = jsonDecode(responce.body);
    return responcebody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestState"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return Container(
                      child: Text(snapshot.data[i]['username']),
                    );
                  });
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
