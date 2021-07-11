import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mar/provider/modalHud.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:mar/widgets/custom_logo.dart';
import 'package:mar/widgets/custom_textfiled.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'package:mar/Services/auth.dart';
import 'login_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  static String id = 'SignupScreen';
  String _email,_password;
  final _auth=Auth();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
          backgroundColor: kMainColor,
          body: ModalProgressHUD(
            inAsyncCall: Provider.of<ModalHud>(context).isLoading,
            child: Form(
              key: _globalKey,
              child: ListView(
                children: [
                  Custom_Logo(),
                  SizedBox(
                    height: height*.1,
                  ),
                  CustomTextField(
                      onClick: (value)
                      {

                      },
                      icon: Icons.perm_identity,
                      hint: 'Enter Your Name'
                  ),
                  SizedBox(
                    height: height*.02,
                  ),
                  CustomTextField(
                    onClick: (value)
                    {
                      _email=value;
                    },
                    hint: 'Enter Your Email',
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: height*.02,
                  ),
                  CustomTextField(
                      onClick: (value)
                      {
                        _password=value;
                      },
                      icon: Icons.lock,
                      hint: 'Enter Your Password'
                  ),
                  SizedBox(
                    height: height*.04,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 140),
                      child: Builder(
                        builder: (context) => FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () async
                          {
                            final modalhud = Provider.of<ModalHud>(context, listen: false);
                            modalhud.changeisLoading(true);
                            if(_globalKey.currentState.validate())
                              {
                                _globalKey.currentState.save();
                                try {
                                  final authResult = await _auth.signUp(
                                      _email, _password);
                                  modalhud.changeisLoading(false);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Scan()),
                                  );
                                }
                                on PlatformException catch(e)
                            {
                              modalhud.changeisLoading(false);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                    e.message,
                                  ),
                              ));
                            }
                              }
                            modalhud.changeisLoading(false);
                          },
                          color: Colors.black,
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                  ),
                  SizedBox(
                    height: height*.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do have an account ? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text('Login',
                            style: TextStyle(
                              fontSize: 16,
                            )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      );
  }
}


