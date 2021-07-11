import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/provider/modalHud.dart';
import 'package:mar/widgets/custom_textfiled.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {

  static String id='LoginScreen';

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController editController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool keepMeLoggedIn = false;

  final _auth = Auth();

  String _email;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: kMainColor,
        body: ModalProgressHUD(
          inAsyncCall: Provider
              .of<ModalHud>(context)
              .isLoading,
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                          image: AssetImage('images/icons/medical.png'),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            'Scan Your Analysis',
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: editController,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email_outlined,
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
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 140),
                    child: Builder(
                      builder: (context) =>
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Reset Password',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              resetPassword(context);
                            },
                            color: Colors.black,
                          ),
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
  void resetPassword(BuildContext context) async{
    if(editController.text.length == 0 || !editController.text.contains('@'))
      {
        Fluttertoast.showToast(msg: "Enter valid email");
        return;
      }
    await FirebaseAuth.instance.sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(msg: "Reset Password link has sent to your mail ");
    Navigator.pop(context);
  }
}
