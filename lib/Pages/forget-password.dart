import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();

  bool verifyButton = false;
  String verifylink;

  Future checkMail() async {
    var response = await http.post(
        'http://192.168.1.103/flutter_forget_password/check.php' /* الملف اللي ف الhtdocs بتاع الphp*/,
        body: {
          "Email": email.text,
        });
    var link = json.decode(response.body);

    if (link == "INVALID EMAIL") {
      showToast("This Email Not Found", gravity: Toast.CENTER, duration: 3);
    } else {
      setState(() {
        verifylink = link;
        verifyButton = true;
      });
      showToast("Click Verify To Reset Your Password",
          gravity: Toast.BOTTOM, duration: 3);
    }
    print(link);
  }

  int newPass = 0;
  Future resetPassword(String verifylink) async {
    var response = await http.post(verifylink);
    var link = json.decode(response.body);
    setState(() {
      newPass = link;
      verifyButton = false;
    });
    print(link);
    showToast("Your Password has been reset",
        gravity: Toast.BOTTOM, duration: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 50, bottom: 20),
              child: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'enter your mail ',
                  border: new OutlineInputBorder(
                      //borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                      borderSide:
                          BorderSide(color: Colors.white) //This is Ignored,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.lightBlue[800],
                onPressed: () {
                  checkMail();
                },
                child: Text("Send"),
              ),
            ),
            verifyButton
                ? MaterialButton(
                    color: Colors.blueGrey[900],
                    onPressed: () {
                      resetPassword(verifylink);
                    },
                    child: Text("Verify"),
                  )
                : Container(),
            newPass == 0 ? Container() : Text('New Password is $newPass')
          ],
        ),
      ),
    );
  }

  showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
