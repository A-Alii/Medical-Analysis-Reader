import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Components/myDrawer.dart';
import 'package:mar/constants.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart 'as http ;

class Deatils extends StatefulWidget {

  @override
  _DeatilsState createState() => _DeatilsState();
}

class _DeatilsState extends State<Deatils> {

  var UserId = "";

  var username = "none";

  var email;


  Future getimageDetails() async {

  var response =

  await http.get("http://10.0.2.2/medical/getimage_detail.php");

  var responsebody = jsonDecode(response.body);

    return responsebody;

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

  getimageDetails();

  getPref();

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        actions: [
          FlatButton(
            child: CircleAvatar(
              child: Image(
                image: AssetImage('images/icons/medical.png'),
              ),
              backgroundColor: Colors.black,
            ),
            onPressed: (){
              Navigator.pushNamed(context, Scan.id);
            },
          )
        ],
        title: Text("Analysis Deatils",
          style: TextStyle(
            fontFamily: 'Pacifico'
          ),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Center(

        child: FutureBuilder(

            future: getimageDetails(),

            builder: (BuildContext context, AsyncSnapshot snapshot) {

            if (snapshot.hasData) {

            return ListView.builder(

            shrinkWrap: true,

            physics: NeverScrollableScrollPhysics(),

            itemCount: snapshot.data.length,

            itemBuilder: (BuildContext context, int i) {

            return imageDetailsList(

            analysisname: snapshot.data[i]['analysisname'],

            UserId: snapshot.data[i]['UserId'],

            image: snapshot.data[i]['image'],

            );

            });

            }

            return Center(child: CircularProgressIndicator());

            }),

      ),

    );
  }
}

class imageDetailsList extends StatelessWidget {

final UserId;

final analysisname;

final image;


const imageDetailsList({this.UserId, this.analysisname, this.image});


@override

Widget build(BuildContext context) {

return Card(

child: Column(

children: <Widget>[

ListTile(

leading: CircleAvatar(child: Icon(Icons.person)),

title: Container(

margin: EdgeInsets.only(top: 10),

),

trailing: IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),

isThreeLine: true,

subtitle: Column(

children: <Widget>[

Text(

analysisname,

style: TextStyle(fontSize: 16),

),

Image.network("http://10.0.2.2/medical/uploads/$image")

],

),

),

],

),

);

}

}