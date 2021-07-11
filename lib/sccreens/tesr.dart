import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';



class Test  extends StatefulWidget {
  Test ({Key key}) :super (key: key);
  
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
File file;

Future pikercarmera() async{
  final myfile =await ImagePicker().getImage(source: ImageSource. gallery);
  setState(() {
    file =File(myfile.path);
  });

Future upload () async {
  if (file == null) return ;

  String base64 = base64Encode(file.readAsBytesSync());
  String imagename =file.path.split("/").last;
  var url ="http://10.0.2.2:5000/uploadimage.php";
  var data ={"imagename" : imagename,"image64" : base64};
  var response = await http.post(url ,body : data);


}

}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image '),
      ),
      body: Column(children: [
        RaisedButton(child: Text("get Image"),onPressed: pikercarmera) ,
        Center(child: file == null ? Text("Image not selected") : Image.file(file)),
        RaisedButton(child: Text("Upload Image"),onPressed: pikercarmera) ,
      ],),
    );
  }


  }

