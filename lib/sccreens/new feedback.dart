import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Components/mydrawer.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:mar/widgets/custom_logo_feedback.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class Feedback2 extends StatefulWidget {
  static String id = 'Feedback2';
  @override
  _Feedback2State createState() => _Feedback2State();
}

class _Feedback2State extends State<Feedback2> {

  var UserId = "";
  var username = "none";
  var email;


  TextEditingController _addfeedback = new TextEditingController();

  Future addFeedback() async {
    var url = "http://10.0.2.2/medical/feedback.php";
    var data = {"feedback": _addfeedback.text, "UserId": UserId};
    var response = await http.post(url, body: data);
    Navigator.of(context).pushNamed("Feedback2");
    print("$UserId");
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      UserId = preferences.getString("UserId");
      username = preferences.getString("username");
      email = preferences.getString("email");
    });
  }
  @override
  void initState() {
    getPref();
    super.initState();
  }

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
            fontFamily: 'Pacifico',
          ),
        ),
        centerTitle: true,
      ),

      drawer: MyDrawer(),

      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                SizedBox(
                  height: height*.2,
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: TextFormField(
                    controller: _addfeedback,
                    maxLength: 1000,
                    minLines: 10,
                    maxLines: 10,
                    autovalidate: true,
                    cursorColor: kMainColor,


                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 10,top: 20),
                        hintText: "     please briefly describe the issue",
                        filled: true,
                        fillColor: kSecondaryColor,
                        focusedBorder: OutlineInputBorder(

                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                        ),
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
                              border: Border(
                                  top: BorderSide(
                                      color: kMainColor))),
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
                    )
                  ],
                )
              ],
            ),
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