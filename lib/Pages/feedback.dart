  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:medical/Components/mydrawer.dart';

  class Feedback1 extends StatefulWidget {
    @override
    _Feedback1State createState() => _Feedback1State();
  }

  class _Feedback1State extends State<Feedback1> {
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
          title: Text("Feedback"),
          centerTitle: true,
        ),

        drawer: MyDrawer(),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.0),


              Text("Contact us",

                 style: TextStyle(color: Colors.black,

                  fontSize: 25,
                   fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 50.0),
              buildFeedbackSubject(),
              SizedBox(height: 60.0),
              buildFeedbackForm(),

              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {},
                      color: Colors.blue,
                      padding: EdgeInsets.all(16.0),
                      child: Text("Send",

                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),


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

  buildFeedbackSubject() {
    return Container(
      height: 100.0,
      child: Stack(
        children: [
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "subject of the issue",
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.black,

              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(

                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                  ),
                 ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: 200.0,
      child: Stack(
        children: [
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.black,

              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(

                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                  ),
                  ],
              ),
            ),
          ),
        ],
      ),
    );
  }
