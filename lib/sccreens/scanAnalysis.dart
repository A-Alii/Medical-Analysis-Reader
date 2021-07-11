import 'dart:convert';
import 'dart:io';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mar/sccreens/useranalysisdeatils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Components/myDrawer.dart';
import '../Services/auth.dart';
import '../sccreens/infoAnalysis.dart';
import '../constants.dart';
import '../test1.dart';
import 'analysisResult.dart';
import 'knowAnalysis.dart';
import 'login_screen.dart';
import 'select_diseases_for_inform.dart';

class Scan extends StatefulWidget {
  static String id = 'Scan';

  @override
  State<StatefulWidget> createState() {
    return ScanState();
  }
}

class ScanState extends State<Scan> {
 bool _inProcess = false;
 int _bottomBarIndex = 0;
 final _auth = Auth();
 int currentIndex = 0;
 // var UserId = "";
 // var username = "none";
 // var email;
 var result;

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
      );
    } else {
      return Image.asset(
        "images/image/placeholder.jpg",
        /* width: 400,
        height: 400,
        fit: BoxFit.cover, */
      );
    }
  }

  File _selectedFile;

  getImage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });

    final image = await ImagePicker.pickImage(source: source);

    if (image != null) {
      this.setState(() {
        _selectedFile = File(image.path);
        //print("image is : $_selectedFile");
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }


  Future sendToFlask () async{
    if(_selectedFile == null) return;
    String base64 = base64Encode(_selectedFile.readAsBytesSync()) ;
    String imageName = _selectedFile.path.split("/").last;
    final url = 'http://10.0.2.2:5000/image';
    //sending a post request to the url
    var response = await http.post(url, body: json.encode({'imageName' : imageName , "image": base64}));
  }



  File _img;
  Future uploadImage() async {
    final uri = Uri.parse("http://10.0.2.2/medical/upload.php");
    var request = http.MultipartRequest('POST', uri);
    var pic = await http.MultipartFile.fromPath('image', _img.path);
    request.files.add(pic);
    var response = await request.send();


    if (response.statusCode == 200) {
      print("Image Uploades");
    } else {
      print("Image Not Uploades");
    }
  }

  int currentTab = 0;
  final List<Widget> screens = [
    Scan(),
  ]; // to store nested tabs




 final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Scan(); // Our first view in viewport



  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String error = 'Error';






  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }


  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  uploadImg() {
    if (null == tmpFile) {
      setStatus(error);
      return;
    }



    String fileName = tmpFile.path.split('/').last;

    upload(fileName);
  }


  upload(String fileName) {
    http.post('http://10.0.2.2/medical/upload.php', body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : error);
    }).catchError((error) {
      setStatus(error);
    });
  }

 var UserId = "";

 var username = "none";

 var email;

 Future addimage() async {

 var url = "http://10.0.2.2/medical/upload.php";

 var data = {"image": _selectedFile.toString(), "UserId": UserId};

 var response = await http.post(url, body: data);

// Navigator.of(context).pushNamed("Feedback2");
 print (response);

 }
 TextEditingController _addname = new TextEditingController();




upload1() {

 if (_selectedFile == null) return;
 final bytes = File(_selectedFile.path).readAsBytesSync();
  String base64 = base64Encode(bytes);
  String imagename = _selectedFile.path.split('/').last;
   //var url = "http://10.0.2.2/medical/userupload.php";
  var flaskapi = "http://10.0.2.2:5000/image";
  // var data = { "image64": base64, "UserId": UserId  };
  var data1 ={"user_id":UserId};
   //var response = await http.post(url, body: data);
  http.post(flaskapi,body :data1).then((response) {
    Map<String, dynamic> analysedData = json.decode(response.body);
    print(analysedData);
    print(analysedData['aspect']);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AnalysisResult(data: analysedData)),
    );
  });


      /*print ("ahmed");
      print (flaskresponse);
      print(UserId);*/


 }
 upload2() async{



   if (_selectedFile == null) return;
   final bytes = File(_selectedFile.path).readAsBytesSync();
   String base64 = base64Encode(bytes);
   String imagename = _selectedFile.path.split('/').last;
   var url = "http://10.0.2.2/medical/userupload.php";

   var data = { "image64": base64, "UserId": UserId  };
   var response = await http.post(url, body: data);


   http.post(response,body :data).then((response) {
     Map<String, dynamic> analysedData = json.decode(response.body);
   });


   /*print ("ahmed");
      print (flaskresponse);
      print(UserId);*/


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

 getPref();

 super.initState();

 }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan Analysis',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kMainColor,
        actions: <Widget>[
          FlatButton(
            child: CircleAvatar(
              child: Image(
                image: AssetImage('images/icons/medical.png'),
              ),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Scan.id);
            },
          ),
        ],
        // put word in center
        centerTitle: true,
        elevation: 100,
      ),

      // Drawer for english
      drawer: MyDrawer(),
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*Padding(
                  padding: const EdgeInsets.only(top: 50,bottom: 60),
                  child: Image(
                    image: AssetImage('images/icons/medical.png'),
                  ),
                ),*/
                  //Placeholder(),

                  /*TextField(
                    controller: _addname,

                  ),*/


                  getImageWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: kMainColor,
                        ),
                        onPressed: () {
                          getImage(ImageSource.camera);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: kMainColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(Scan.id);

                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.file_upload,
                          color: kMainColor,
                        ),
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
                      new Text(
                        "captuared analysis",
                        style: TextStyle(
                          color: kMainColor,
                        ),
                      ),
                      new Text(
                        "Clear analysis",
                        style: TextStyle(
                          color: kMainColor,
                        ),
                      ),
                      new Text(
                        "upload analysis",
                        style: TextStyle(
                          color: kMainColor,
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Divider(
                    color: kMainColor,
                    endIndent: 40,
                    height: 50,
                    indent: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 140),
                    child: Builder(
                      builder: (context) => FlatButton(
                        //padding: EdgeInsets.only(bottom: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),

                        onPressed: () async{
                          if (_selectedFile == null) {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    title: Text(
                                      'Error!',
                                      style: TextStyle(color: Colors.deepOrange),
                                    ),
                                    content:
                                    Text('Please upload analysis image!'),
                                    actions: [
                                      Center(
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Ok',
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          }
                          else {
                            await upload1();
                             upload2();
                          }
                        },
                        color: kMainColor,
                        child: Text(
                          "Scan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            (_inProcess)
                ? Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.98,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : Center()
          ],
        ),
      ),

      //Navigation
      bottomNavigationBar: BottomNavyBar(
        animationDuration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        selectedIndex: currentIndex,
        onItemSelected: (index) async {
          if (index == 3) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.clear();
            await _auth.signOut();
            Navigator.popAndPushNamed(context, LoginScreen.id);
          }
          setState(() {
            _bottomBarIndex = index;
          });
          if (index == 1) {
            Navigator.pushNamed(context, Information.id);
          }
          setState(() {
            _bottomBarIndex = index;
          });
          if (index == 2) {

            Navigator.pushNamed(context, Diseases.id);
          }
          if (index == 0) {
            Navigator.pushNamed(context, Scan.id);
          }
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(
              Icons.camera_alt,
            ),
            title: Text('Scan'),
            activeColor: kMainColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.perm_device_information,
            ),
            title: Text('Information'),
            activeColor: kMainColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.open_in_new_outlined,
            ),
            title: Text('Know analysis'),
            activeColor: kMainColor,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}