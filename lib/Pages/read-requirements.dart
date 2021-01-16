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
  Future<Null> showMoreInfo(BuildContext context, String value, String value2, String value3, String value4) async{
    
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$value3'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Fedback_Id: $value'),
              Text('User_Id: $value2'),
              Text('Feedback_Subject: $value3'),
              Text('Feedback_Message: $value4'),
              TextButton(
            child: Text('cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
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
                 onPressed: () {},
              ),
                    ButtonBar(
                children: [
                  FlatButton.icon(
                    icon: Icon(Icons.open_in_new),
                    label: Text('open in webview'),
                    onPressed: () {
                      
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
    var res = await http.get("https://jsonfile789.000webhostapp.com/feedback.json");
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
                  return ListTile(
                    leading: CircleAvatar(
                      child: new Text("${snapShot.data[0]['Feedback_Subject']}"),
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,),
                    title: Text("${snapShot.data[0]['Feedback_Subject']}", style: TextStyle(fontSize: 22.0),),
                    subtitle: Text("${snapShot.data[0]['Feedback_Message']}"),
                    onTap: ()  { showMoreInfo(
                      context, 
                      '${snapShot.data[0]['Feedback_Id']}',
                      '${snapShot.data[0]['User_Id']}',
                      '${snapShot.data[0]['Feedback_Subject']}',
                      '${snapShot.data[0]['Feedback_Message']}'
                      );}
                  );
                  
                },
                itemCount: 1,
              );
              
            }
            
          },
        ),

        
        
        

        // children: [
        //   Container(
        //     padding: EdgeInsets.only(top: 30.0, left: 10.0),
        //     child: Text(
        //       "CBC Test",
        //       style: TextStyle(fontSize: 30),
        //     ),
        //   ),
        //   Divider(
        //     color: Colors.blue,
        //   ),
        //   Container(
        //     padding: EdgeInsets.all(20.0),
        //     child: Column(
        //       children: [
        //         Container(
        //           color: Colors.white,
        //           child: Column(
        //             children: [
        //               Text(
        //                   "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
        //               Text(
        //                   "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
        //               Text(
        //                   "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
        //                   Text(
        //                   "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
        //               Text(
        //                   "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup company."),
        //               Text(
        //                   "About  page in flutter About  page in flutter M.A.R About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter About  page in flutter bla ahmed lsjjd jf simple app that generates proposed names for a startup."),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        
        
        //     ],
        //   ),
        // ],
      ),
      
    );
    
  }
}