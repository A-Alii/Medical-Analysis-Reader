import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mar/constants.dart';
import 'package:mar/sccreens/resetPassword.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

showloading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [Text("Loading....."), CircularProgressIndicator()],
          ),
        );
      });
}

showdialogall(context, String mytitle, String mycontent) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(mytitle),
          content: Text(mycontent),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.blue),
                )),
          ],
        );
      });
}

class _LogInState extends State<LogIn> {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  bool isLoading = false;
  // Start Form Controller




  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  GlobalKey<FormState> formstatesignin = new GlobalKey<FormState>();
  GlobalKey<FormState> formstatesignup = new GlobalKey<FormState>();




  savePref(String username, String email, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("UserId", id);
    preferences.setString("username", username);
    preferences.setString("email", email);
    print(preferences.getString("username"));
    print(preferences.getString("email"));
    print(preferences.getString("UserId"));
  }











  String validglobal(String val) {
    if (val.isEmpty) {
      return "Filed can't be empty";
    }
  }

// trim for spacing
  String validusername(String val) {
    if (val.trim().isEmpty) {
      return "Filed can't be empty";
    }
    if (val.trim().length < 4) {
      return "User Name Minimum Length 4 characters";
    }
    if (val.trim().length > 20) {
      return "User Name Maximum Length 20 characters";
    }
  }

  String validpassword(String val) {
    if (val.trim().isEmpty) {
      return "Filed can't be empty";
    }
    if (val.trim().length < 4) {
      return "password Minimum Length 4 characters";
    }
    if (val.trim().length > 20) {
      return "password Maximum Length 20 characters";
    }
  }

  String validconfirmpassword(String val) {
    if (val != password.text) {
      return "Not Matched With Password";
    }
  }

  String validemail(String val) {
    if (val.trim().isEmpty) {
      return "Filed can't be empty";
    }
    if (val.trim().length < 4) {
      return "User Name Minimum Length 4 characters";
    }
    if (val.trim().length > 50) {
      return "User Name Maximum Length 20 characters";
    }
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val)) {
      return "Email not valid for ex: ahmed@gmail.com";
    }
  }









  signin() async {
    var formdata = formstatesignin.currentState;
    if (formdata.validate()) {
      formdata.save();
      showloading(context);
      var data = {"email": email.text, "password": password.text};
      var url = "http://10.0.2.2/medical/login.php";
      var response = await http.post(url, body: data);
      var responcebody = jsonDecode(response.body);
      if (responcebody['status'] == 'success') {
        savePref(responcebody['username'], responcebody['email'], responcebody['id']);
        Navigator.of(context).pushNamed("Scan");
      } else {
        print("Login Faild ");
        showdialogall(context, "Error!", "Email Or Password Invalid");
        Navigator.of(context).pop();
      }
    } else {
      print("not valid");
    }
  }

  signup() async {
    var formdata = formstatesignup.currentState;
    if (formdata.validate()) {
      formdata.save();
      showloading(context);
      var data = {"email" : email.text, "password" : password.text, "username" : username.text};
      var url = "http://10.0.2.2/medical/signup.php";
      var response = await http.post(url, body: data);
      var responcebody = jsonDecode(response.body);
      if (responcebody['status'] == 'success') {
        savePref(responcebody['username'], responcebody['email'], responcebody['UserId']);
        Navigator.of(context).pushNamed("Scan");
      } else {
        print("Login Faild ");
        //Navigator.of(context).pop();
        showdialogall(context, "Error!", "Email is Exist");
      }
    } else {
      print("not valid");
    }
  }






  TapGestureRecognizer _changesign;
  bool showsignin = true;

  @override
  void initState() {
    _changesign = new TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showsignin = !showsignin;
          print(showsignin);
        });
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;

    return Container(
      child: Scaffold(
        backgroundColor: kMainColor,
        body: Stack(
          children: [
            Container(height: double.infinity, width: double.infinity),
            // call method position top
            buildPositionedtop(mdw),
            // call method position bottom
            buildPositionedBottom(mdw),
            Container(
                height: 1000,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Text(
                                showsignin ? "log in" : "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                              ))),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      buildContainerAvatar(mdw),
                      showsignin
                          ? buildFormBoxSignIn(mdw)
                          : buildFormBoxSignUp(mdw),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            showsignin
                                ? InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('Forget');
                              },
                              child: TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPassword())),
                                  child: Text('Forgot Password ?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                            )

                                : SizedBox(),
                            SizedBox(height: showsignin ? 24 : 5),
                            RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                                color: showsignin ? Colors.black : Colors.black,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                onPressed: showsignin ? signin : signup,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(showsignin ? "LogIn" : "Sign Up",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    Container(
                                        padding: EdgeInsets.only(right: 10),
                                        margin: EdgeInsets.only(top: 4),
                                        child: Icon(Icons.arrow_forward,
                                            color: Colors.white))
                                  ],
                                )),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: showsignin
                                              ? "Does not have account ?"
                                              : "Do You have account ?", style: TextStyle(color: kSecondaryColor)),
                                      TextSpan(
                                          recognizer: _changesign,
                                          text: showsignin
                                              ? "    Sign Up"
                                              : "    Login",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w700)),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Center buildFormBoxSignIn(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeOutBack,
        margin: EdgeInsets.only(top: 70),
        height: 290,
        width: mdw / 1.2,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              //color: Colors.black,
                spreadRadius: 0.1,
                blurRadius: 1,
                offset: Offset(0, 0))
          ],
        ),
        child: Form(
          autovalidate: true,
          key: formstatesignin,
          child: Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Start TextField UserName
                  Text("Email",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  buildTextFormFieldAll("Enter Email....", Icons.email , false, email, validemail),
                  //End TextField UserName
                  SizedBox(height: 10),
                  //************************************************************************************************ */
                  //Start TextField password
                  Text("Password",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  buildTextFormFieldAll(
                      "Enter Password....",Icons.lock, true, password, validpassword),
                  //End TextField password
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center buildFormBoxSignUp(double mdw) {
    return Center(
      child: AnimatedContainer(
        curve: Curves.easeInOutBack,
        duration: Duration(milliseconds: 600),
        margin: EdgeInsets.only(top: showsignin ? 50 : 60),
        height: 360,
        width: mdw / 1.2,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: kMainColor,
                spreadRadius: 0.1,
                blurRadius: 1,
                offset: Offset(0, 0))
          ],
        ),
        child: Form(
          autovalidate: true,
          key: formstatesignup,
          child: Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Start TextField UserName
                  Text("User Name",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  buildTextFormFieldAll(
                      "Enter UserName....", Icons.supervised_user_circle, false, username, validusername),
                  SizedBox(height: 10),
                  Text("Email",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  buildTextFormFieldAll(
                      "Enter Email....",Icons.email, false, email, validemail),
                  //End TextField UserName
                  SizedBox(height: 10),
                  //************************************************************************************************ */
                  //Start TextField password
                  Text("Password",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  buildTextFormFieldAll(
                      "Enter Password....",Icons.lock, true, password, validpassword),
                  SizedBox(height: 10),
                  Text("Confirm Password",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  buildTextFormFieldAll("Confirm Password....",Icons.lock, true,
                      confirmpassword, validconfirmpassword),

                  //End TextField password
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldAll(String myhinttext, icon ,bool pass, TextEditingController myController, myvalid) {
    return TextFormField(
      controller: myController,
      obscureText: pass,
      validator: myvalid,
      cursorColor: kMainColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(4),
        hintText: myhinttext,
        filled: true,
        fillColor: kSecondaryColor,
        prefixIcon: Icon(
          icon,
          color: kMainColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: kMainColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            )
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            )
        ),
      ),
    );
  }

  AnimatedContainer buildContainerAvatar(double mdw) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: showsignin ? kMainColor : kMainColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(color: kSecondaryColor, blurRadius: 30, spreadRadius: 10)
        ],
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            showsignin = !showsignin;
          });
        },
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 20,
              child: Image(
                image: AssetImage('images/icons/medical.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // method for position top
  Positioned buildPositionedtop(double mdw) {
    return Positioned(
        child: Transform.scale(
          // for larger circular to right and left
          scale: 1.3,
          child: Transform.translate(
            // for position and movement to top
            offset: Offset(0, -mdw / 1.7),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: mdw,
                width: mdw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mdw),
                    color: showsignin
                        ? Colors.grey[800]
                        : Colors.black)),
          ),
        ));
  }

  // method for position bottom
  Positioned buildPositionedBottom(double mdw) {
    return Positioned(
      top: 300,
      left: mdw / 1.5,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        height: mdw,
        width: mdw,),
    );
  }
}