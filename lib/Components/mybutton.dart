import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final title;
  final function;
  final mdw;
  const MyButton({Key key,this.function, this.title, this.mdw}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: function, 
      minWidth: mdw/2,
      child: Text("$title", style:TextStyle(color: Colors.white, fontSize:20)),);
  }
}