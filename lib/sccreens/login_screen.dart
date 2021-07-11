import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mar/Services/auth.dart';
import 'package:mar/provider/modalHud.dart';
import 'package:mar/sccreens/resetPassword.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:mar/sccreens/signup_screen.dart';
import 'package:mar/widgets/custom_textfiled.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  static String id='LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();

  bool keepMeLoggedIn=false;

  final _auth=Auth();

  String _email,_password;

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
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Container(
                  height: MediaQuery.of(context).size.height*.2,
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
                height: height*.1,
              ),
              CustomTextField(
                onClick: (value) {
                  _email = value;
                },
                hint: 'Enter Your Email',
                icon: Icons.email,
              ),
              SizedBox(
                height: height*.02,
              ),
              CustomTextField(
                  onClick: (value) {
                    _password = value;
                  },
                  icon: Icons.lock,
                  hint: 'Enter Your Password'
              ),
              SizedBox(
                height: height*.02,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Theme(
                          data : ThemeData(
                              unselectedWidgetColor: Colors.white
                          ),
                          child: Checkbox(
                              checkColor: kSecondaryColor,
                              activeColor: kMainColor,
                              value: keepMeLoggedIn,
                              onChanged: (value)
                              {
                                setState(() {
                                  keepMeLoggedIn = value;
                                });
                              }
                          ),
                        ),
                        Text('Remeber Me ', style: TextStyle(
                            color: Colors.white
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPassword())),
                              child: Text('Forgot Password ?', style: TextStyle(decoration: TextDecoration.underline),)),
                        )
                      ],
                    ),
                  ),
                ],
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
                    onPressed: ()async
                    {
                      if(keepMeLoggedIn == true)
                        {
                          keepUserLoggedIn();
                        }
                      final modalhud = Provider.of<ModalHud>(context, listen: false);
                      modalhud.changeisLoading(true);
                      if(_globalKey.currentState.validate())
                      {
                        try{
                        _globalKey.currentState.save();
                        final result=await _auth.signIn(_email.trim(), _password.trim());
                        modalhud.changeisLoading(false);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Scan()),
                        );
                        }on PlatformException catch(e)
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
                      'Login',
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account ? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignupScreen()),
                          );
                        },
                        child: Text('Signup',
                          style: TextStyle(
                          fontSize: 16,
                        )
                        ),
                      ),
                    ],
                  ),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPassword())),
                          child: Text('Forgot Password ?', style: TextStyle(fontFamily: 'Pacifico'),))
                    ],
                  )*/
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  void keepUserLoggedIn() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kKeeppMeLoggedIn, keepMeLoggedIn);
  }
}


