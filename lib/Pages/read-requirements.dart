import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medical/Pages/nearest-lab.dart';
import 'package:url_launcher/url_launcher.dart';

class ReadReq extends StatefulWidget {
  @override
  _ReadReqState createState() => _ReadReqState();
}

class _ReadReqState extends State<ReadReq> {
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

  Future fetchdata() async {
    var res =
        await http.get("https://jsonfile789.000webhostapp.com/feedback.json");
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj;
    }
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
      body: Center(
        child: FutureBuilder(
          future: fetchdata(),
          builder: (ctx, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      Text(
                        "${snapShot.data[0]['Feedback_Subject']}",
                        style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold,),
                      ),
                      Divider(
                        endIndent: 40,
                        indent: 40,
                        height: 20,
                        thickness: 1.2,
                        color: Colors.blue,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(15.0),
                          child: Text(
                          "${snapShot.data[0]['Feedback_Message']}",
                          style: TextStyle(fontSize: 22.0,),
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 60.0,top: 300.0)),
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
                    ),
                  ],
                ),

                          ],
                        ),
                      ),
                    ],
                      // 
                      );
                },
                itemCount: 1,
              );
            }
          },
        ),
      ),
    );
  }
}


/*
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
                Text('$value3', style: TextStyle(fontSize: 30.0, color: Colors.blue,fontWeight: FontWeight.bold),),
                Padding(padding: EdgeInsets.only(top: 50)),
                Text('Fedback_Id: $value'),
                Padding(padding: EdgeInsets.only(top: 50)),
                Text('User_Id: $value2'),
                Padding(padding: EdgeInsets.only(top: 50)),
                Text('Feedback_Subject: $value3'),
                Padding(padding: EdgeInsets.only(top: 50)),
                Text('Feedback_Message: $value4'),
                Padding(padding: EdgeInsets.only(top: 50)),
                
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
                  onPressed: () {},
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
 */