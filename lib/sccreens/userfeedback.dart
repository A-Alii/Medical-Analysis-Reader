import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Components/mydrawer.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class Feedback1 extends StatefulWidget {
  static String id = 'Feedback1';
  @override
  _Feedback1State createState() => _Feedback1State();
}

class _Feedback1State extends State<Feedback1> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String _email, _password;

  GlobalKey<FormState> feedback = new GlobalKey<FormState>();

  var UserId = "";
  var username = "none";
  var email;

  TextEditingController _addfeedback = new TextEditingController();

  Future addFeedback() async {
    var url = "http://10.0.2.2/medical/feedback.php";
    var data = {"feedback": _addfeedback.text, "UserId": UserId};
    var response = await http.post(url, body: data);
    Navigator.of(context).pushNamed("Feedback1");
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      UserId = preferences.getString("UserId");
      username = preferences.getString("username");
      email = preferences.getString("email");
    });
    if (email != null) {
      setState(() {
        username = preferences.getString("username");
        email = preferences.getString("email");
        UserId = preferences.getString("UserId");
      });
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

/*  int _bottomBarIndex = 0;
  final _auth = Auth();*/

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        actions: <Widget>[
          FlatButton(
            child: CircleAvatar(
              child: Image(
                image: AssetImage('images/icons/medical.png'),
              ),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Scan.id);
            },
          ),
        ],
        title: Text(
          "Feedback",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      drawer: MyDrawer(),

      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * .2,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor:  kMainColor,
                        child: Icon(Icons.person,)),
                    title: TextFormField(

                      controller: _addfeedback,
                      maxLength: 1000,
                      minLines: 10,
                      maxLines: 10,
                      autovalidate: true,
                      cursorColor: kMainColor,
                      key: feedback,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(right: 10, top: 20),
                          hintText: "     please briefly describe the issue",
                          filled: true,
                          fillColor: kSecondaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kMainColor,
                              )),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: kMainColor),
                          )),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: addFeedback,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                Border(top: BorderSide(color: kMainColor))),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Send",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(color: kMainColor, fontSize: 17),
                                ),
                                Padding(padding: EdgeInsets.only(right: 10)),
                                Icon(
                                  Icons.add_box,
                                  color: kMainColor,
                                )
                              ],
                            ),

                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ],
          )
        ],
        //inAsyncCall: Provider.of<ModalHud>(context).isLoading,
        /*child: Form(
          //key: _globalKey,
          child: ListView(
            children: [

              TextField(
                controller: _feedback,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "please briefly describe the issue",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: kMainColor,
                  ),
                  prefixIcon: Icon(
                    Icons.analytics_outlined,
                    color: kMainColor,
                  ),
                  filled: true,
                  fillColor: kSecondaryColor,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                  ),
                ),
              ),

              SizedBox(
                height: height*.05,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 140),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {
                          addFeedback;
                        },
                        color: kMainColor,
                        //padding: EdgeInsets.all(16.0),
                        child: Text("Send",

                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height*.04,
              ),
            ],
          ),
        ),*/
      ),

      //Navigation
    );
  }
}

buildFeedbackSubject() {
  return Container(
    height: 100.0,
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "subject of the issue",
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: kMainColor,
              ),
              prefixIcon: Icon(
                Icons.subject,
                color: kMainColor,
              ),
              filled: true,
              fillColor: kSecondaryColor,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: kMainColor,
              ),
              prefixIcon: Icon(
                Icons.analytics_outlined,
                color: kMainColor,
              ),
              filled: true,
              fillColor: kSecondaryColor,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
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