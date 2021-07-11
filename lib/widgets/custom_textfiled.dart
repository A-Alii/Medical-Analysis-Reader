import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;
  String _errorMessage(String str)
  {
    switch(hint)
    {
      case 'Enter Your Name' :return 'Name Is Empty!';
      case 'Enter Your Email' :return 'Email Is Empty!';
      case 'Enter Your Password' :return 'Password Is Empty!';
    }
  }
  CustomTextField({@required this.onClick,@required this.icon, @required this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value){
          if(value.isEmpty)
            {
              return _errorMessage(hint);
            // ignore: missing_return
            }
        },
        onSaved: onClick,
        obscureText: hint == 'Enter Your Password' ? true:false,
        cursorColor: kMainColor,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: kMainColor,
          ),
          filled: true,
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              )
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
      ),
    );
  }
}