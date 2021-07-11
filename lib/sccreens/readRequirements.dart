import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mar/Components/mydrawer.dart';
import 'package:mar/constants.dart';
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
        backgroundColor: kMainColor,
        actions: <Widget>[
          /*IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )*/
        ],
        title: Text("Requirements", style: TextStyle(fontFamily: 'Pacifico',),),
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
                        style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold,fontFamily: 'Pacifico',),
                      ),
                      Divider(
                        endIndent: 40,
                        indent: 40,
                        height: 20,
                        thickness: 1.2,
                        color: kMainColor,
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
                            Padding(padding: EdgeInsets.only(left: 60.0,top: 100.0)),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: kMainColor,
                              child: Text(
                                "nearest lab",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                openurl();
                              },
                            ),
                            ButtonBar(
                              children: [
                                FlatButton.icon(

                                  icon: Icon(Icons.language, color: kMainColor,),
                                  label: Text('open in webview', style: TextStyle(
                                    color: kMainColor,
                                  ),),
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
