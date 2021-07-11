import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mar/Services/auth.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import 'package:mar/sccreens/scanAnalysis.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class Notes extends StatefulWidget {
  final Map<String, dynamic> dataNotes;

  Notes({this.dataNotes});

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  int _bottomBarIndex = 0;
  final _auth = Auth();
  bool isExpand = false;

  VoiceController _voiceController;
  String text ="Abnormal Urinalysis color, this may be due to the presence of blood, or perhaps due to eating some foods or due to taking some medications";
  String text1 ="This could be due to kidney damage or kidney disease";
  String text2 =" The presence of glucose in the urine may indicate a high concentration in the blood; This may be linked to diabetes, or kidney disorders that cause a reduced ability to absorb";
  String text3 ="Its appearance indicates a urinary tract infection";
  String text4 ="It is present in the urine in a certain percentage, and its higher than normal percentage may be a sign of a problem, but it is worth noting that menstrual blood and hemorrhoids can also appear in the urine, in addition to the fact that there are many simple cases that cause red blood cells to rise and heal on their own. itself even without treatment";
  String text5 ="An increased number of WBCs seen in the urine under a microscope and/or positive test for leukocyte esterase may indicate an infection or inflammation somewhere in the urinary tract. If also seen with bacteria (see below), they indicate a likely urinary tract infection";



  @override
  void initState() {
    _voiceController = FlutterTextToSpeech.instance.voiceController();
    isExpand = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _voiceController.stop();
  }

  _playVoice() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text,
        VoiceControllerOptions(),
      );
    });
  }

  _playVoice1() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text1,
        VoiceControllerOptions(),
      );
    });
  }

  _playVoice2() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text2,
        VoiceControllerOptions(),
      );
    });
  }

  _playVoice3() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text3,
        VoiceControllerOptions(),
      );
    });
  }

  _playVoice4() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text4,
        VoiceControllerOptions(),
      );
    });
  }
  _playVoice5() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text5,
        VoiceControllerOptions(),
      );
    });
  }


  _stopVoice() {
    _voiceController.stop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: kMainColor,
          title: Text("Notes of analysis", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          centerTitle: true,
          actions: [
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
        ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                widget.dataNotes['collection'] == "random"? Text("")
:                ExpansionTile(
                    title: Container(
                      width: double.infinity,
                      child: Text(
                        "Collection",
                        //widget.dataNotes['aspect'],
                        style: TextStyle(fontSize: 18),
                      ),

                    ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['collection']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                      setState(() {
                        isExpand = value;
                      });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Column(
                             children: [
                               IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice)
                              // Icon(Icons.record_voice_over_outlined, color: Colors.orange,)
                             ],
                           ),
                           Column(
                             children: [
                               Text("Your Analysis of Collection is"),
                             ],
                           )
                         ],
                       ),

                      ),
                    )
                  ],
                ),

                SizedBox(height: 0,),
                widget.dataNotes['color'] == "yellow"? Text(""):
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "Color",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['color']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice)
                              ],
                            ),
                            Column(
                              children: [
                                Container(width:250,child: Text(text)),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 0,),
                widget.dataNotes['aspect'] == "clear"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "aspect",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['aspect']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.record_voice_over_outlined, color: Colors.orange,)
                              ],
                            ),
                            Column(
                              children: [
                                Container(width:250,child: Text(text)),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 0,),
                widget.dataNotes['reaction'] == "acidic"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "reaction",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['reaction']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice1)
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    width: 250,
                                    child: Text("$text1")),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                widget.dataNotes['proteins'] == "nil"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "proteins",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['proteins']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice1)
                              ],
                            ),
                            Column(
                              children: [

                                Container(
                                    width: 250,
                                    child: Text("$text1")
                                ),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                widget.dataNotes['glucose'] == "nil"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "glucose",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['glucose']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice2)
                              ],
                            ),
                            Column(
                              children: [
                                Container(width:250,child: Text(text2)),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),

                SizedBox(height: 0,),
                widget.dataNotes['ketone_bodies'] == "nil"? Text(""):
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "ketone_bodies",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['ketone_bodies']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice)
                              ],
                            ),
                            Column(
                              children: [
                                 Container(
                                     width: 250,
                                     child: Text("$text")),                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 0,),
                widget.dataNotes['bilirubin'] == "nil"? Text(""):
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "bilirubin",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['bilirubin']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice)
                              ],
                            ),
                            Column(
                              children: [
                                Text("Your Analysis of Color is"),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 0,),
                widget.dataNotes['nitrite'] == "negative"|| widget.dataNotes['nitrite'] == "nil"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "nitrite",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['nitrite']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice3)
                              ],
                            ),
                            Column(
                              children: [
                                Container(width:250,child: Text(text3)),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 0,),
                widget.dataNotes['epithelial_cells'] == "nil"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "epithelial_cells",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['epithelial_cells']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice1)
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    width: 250,
                                    child: Text("$text1 ")),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                widget.dataNotes['red_blood_cells'] == "0" || widget.dataNotes['red_blood_cells'] == "1" || widget.dataNotes['red_blood_cells'] == "2"? Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "red_blood_cells",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['red_blood_cells']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice4)
                              ],
                            ),
                            Column(
                              children: [

                                Container(
                                  width: 250,
                                    child: Text("$text4")
                                ),
                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                widget.dataNotes['pus_cells'] == "0" || widget.dataNotes['pus_cells'] == "1" || widget.dataNotes['pus_cells'] == "2"?Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "pus_cells",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['pus_cells']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.record_voice_over_outlined, color: Colors.orange,)
                              ],
                            ),
                            Column(
                              children: [
                                 Text("Your Analysis of Red Blood Cells is"),                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                widget.dataNotes['bacteruria'] == "nil"?Text("") :
                ExpansionTile(
                  title: Container(
                    width: double.infinity,
                    child: Text(
                      "bacteruria",
                      //widget.dataNotes['aspect'],
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  subtitle: Container(
                    width: 20,
                    child: Text(widget.dataNotes['bacteruria']),
                  ),
                  leading: Icon(Icons.medical_services_outlined, color: Colors.red,),
                  trailing: (isExpand != true) ? Icon(Icons.arrow_drop_down, size: 32, color: kMainColor,): Icon(Icons.arrow_drop_up, size: 32, color: kMainColor,),
                  onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice5)
                              ],
                            ),
                            Column(
                              children: [
                                Container(width:250,child: Text(text5)),                              ],
                            )
                          ],
                        ),


                      ),
                    )
                  ],
                ),

              ],
            ),
            Divider(
              color: kMainColor,
              height: 25,
              endIndent: 15,
              indent: 15,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Text("Recomended Doctor", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),),
            ),
            Divider(
              color: kMainColor,
              height: 25,
              endIndent: 15,
              indent: 15,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(0)),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Container(width: 200,child: Text("press on this icon to search for urology doctor", style: TextStyle(color: Colors.black),)),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Column(
                                    children: [
                                      IconButton(icon: Icon(Icons.location_on_outlined, color: Colors.orange,size: 50,), onPressed: urologyDoctor)
                                    ],
                                  ),
                                )
                              ],
                            )


                          ],
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
            /*Divider(
              color: kMainColor,
              height: 25,
              endIndent: 15,
              indent: 15,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Text("Recomended Analysis", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),),
            ),
            Divider(
              color: kMainColor,
              height: 25,
              endIndent: 15,
              indent: 15,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(20.0)),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text("", style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            /*Row(
                              children: [
                                Column(
                                  children: [
                                    Text("urology doctor", style: TextStyle(color: Colors.grey[500]),),
                                    Text("urology doctor", style: TextStyle(color: Colors.grey[500]),),
                                    IconButton(icon: Icon(Icons.record_voice_over_outlined, color: Colors.orange,), onPressed: _playVoice3)
                                  ],
                                ),
                                Column(
                                  children: [

                                  ],
                                )
                              ],
                            )*/

                          ],
                        ),
                      ),
                      Icon(Icons.star_border, color: Colors.yellow,),
                    ],
                  ),

                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }

  urologyDoctor() async{
    const url1 ='https://www.google.com/maps/search/?api=1&query=urology+doctor';
    if (await canLaunch(url1)) {
      await launch(url1);
    } else {
      throw 'Could not launch $url1';
    }
  }

}
