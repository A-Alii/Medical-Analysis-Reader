import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medical/Components/mydrawer.dart';
import 'package:medical/Pages/nearest-lab.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatefulWidget {
  @override
  _Informationtate createState() => _Informationtate();
}

class _Informationtate extends State<Information> {

  List analysis = [];
  List filteredanalysis = [];
  
  Future<Null> showMoreInfo(BuildContext context, String value, String value2,
      String value3, String value4) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.brown[100],
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Positioned(
                  right: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 18.0,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close, color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Text(
                        '$value3',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: Colors.blueAccent,
                        endIndent: 40,
                        height: 20,
                        indent: 40,
                        thickness: 1.2,
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Text('$value4'),
                      
                    ],
                  ),
                ),
              ],
              
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  color: Colors.blue,
                  child: Text(
                    "nearest lab",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Nearest()));
                  },
                ),
                ButtonBar(
                  children: [
                    FlatButton.icon(
                      icon: Icon(Icons.open_in_new),
                      label: Text('open in webview'),
                      onPressed: () {
                        setState(() {
                          _launched =
                              _launchInWebViewOrVC("https:www.google.com");
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future fetchdata() async {
    var res = await http.get("https://jsonplaceholder.typicode.com/comments");
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj;
    }
  }

bool isSearching = false;



@override
  void initState() {
    fetchdata().then((data) {
      setState(() {
        analysis = filteredanalysis = data;
      });
    });
    super.initState();
  }

  void _filteranalysis(value){
  setState(() {
      filteredanalysis = analysis
          .where((country) =>
              country['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
}

Future<void> _launched;
  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          isSearching ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                this.isSearching = false;
              });
            },
          ):
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                this.isSearching = true;
              });
            },
          ),
        ],
        title: !isSearching 
        ? Text("Information")
        : TextField(
          onChanged: (value){
            _filteranalysis(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(hintText: "Serach For Analysis here...",
          icon: Icon(Icons.search, color: Colors.white,),
          hintStyle: TextStyle(color: Colors.white)
          ),),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: filteredanalysis.length > 0 ? ListView.builder(
                itemBuilder: (_, index) {
                  return Container(
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.arrow_forward_ios),
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                          ),
                          title: Text(
                            "${filteredanalysis[index]['name']}",
                            style: TextStyle(fontSize: 22.0),
                          ),
                          onTap: () {
                            showMoreInfo(
                                context,
                                '${filteredanalysis[index]['postId']}',
                                '${filteredanalysis[index]['id']}',
                                '${filteredanalysis[index]['name']}',
                                '${filteredanalysis[index]['body']}');
                          },
                        ),
                      ],
                    ),
                  );
                },
                itemCount: filteredanalysis.length,
              ):CircularProgressIndicator(),
              ),
      
    );
  }
}
