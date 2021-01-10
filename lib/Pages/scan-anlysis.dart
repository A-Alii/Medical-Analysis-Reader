import 'package:flutter/material.dart';
import 'package:medical/Components/mydrawer.dart';
import 'package:medical/Components/mynavigation.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical/Pages/feedback.dart';
import 'package:medical/Pages/information-analysis.dart';
import 'package:medical/Pages/nearest-lab.dart';

class Scan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScanState();
  }
}

class ScanState extends State<Scan> {
  File _selectedFile;
  bool _inProcess = false;

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Placeholder(
        color: Colors.blue,
        fallbackHeight: 300,
        fallbackWidth: 300,
        strokeWidth: 1.5,
      );
    }
  }

  getImage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
    File image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          ));

      this.setState(() {
        _selectedFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  int currentTab = 0;
  final List<Widget> screens = [
    Scan(),
    Nearest(),
    Information(),
    Feedback1(),
  ]; // to store nested tabs

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Scan(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Analysis"),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        // put word in center
        centerTitle: true,

        // shadoo
        elevation: 100,
        // befor text عكس ال action
        //leading: IconButton(icon: Icon(Icons.security), onPressed: (){},),
        //titleSpacing: 60,
        // change color of wifi and betari
        //brightness: Brightness.light,
      ),

      // Drawer for english
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Placeholder(),
          getImageWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  getImage(ImageSource.camera);
                },
              ),
              IconButton(
                icon: Icon(Icons.file_upload),
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
          (_inProcess)
              ? Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.95,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Center(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text("Upload A photo"),
              new Text("Take A photo")
            ],
          ),
          Divider(
            color: Colors.blue,
          ),
          MaterialButton(
            color: Colors.blue,
            child: Text(
              "Go",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
      // bottomNavigationBar: new BottomNavigationBar(items: [
      //   new BottomNavigationBarItem(icon: new Icon(Icons.camera_alt),
      //   title: new Text("Scan")
      //   ),
      //   new BottomNavigationBarItem(icon: new Icon(Icons.bar_chart),
      //   title: new Text("Compare")
      //   ),
      //   new BottomNavigationBarItem(icon: new Icon(Icons.location_pin),
      //   title: new Text("Nearest")
      //   ),
      //   new BottomNavigationBarItem(icon: new Icon(Icons.feedback),
      //   title: new Text("Feedback")
      //   ),
      // ],
      //   type: BottomNavigationBarType.fixed,

      // ),
      
      //Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            title: Text('Scan'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_pin,
            ),
            title: Text('Nearesrt'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.open_in_new_outlined,
            ),
            title: Text('compare'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.feedback,
            ),
            title: Text('feedback'),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
/*
            Icon(Icons.bar_chart, size: 30, color: Colors.brown,),

            Icon(Icons.location_pin, size: 30, color: Colors.brown,),

            Icon(Icons.open_in_new_outlined, size: 30, color: Colors.brown,),  

            Icon(Icons.feedback, size: 30, color: Colors.brown,),
            
          
          color: Colors.lightBlue,
          buttonBackgroundColor: Colors.white,
          height: 60,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),*/

    /*
            onTap: (value) => {
              Navigator.of(context).pushNamed('Scan'),
            },
            */
  }
}
