import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/Components/mybutton.dart';
import 'package:medical/Components/mydrawer.dart';
import 'package:medical/Pages/read-requirements.dart';

// class check extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//       );
// }

class Know extends StatefulWidget {
  @override
  _KnowState createState() => _KnowState();
}

class _KnowState extends State<Know> {
  Map<String, bool> numbers = {
    'One': false,
    'Two': false,
    'Three': false,
    'Four': false,
    'Five': false,
    'Six': false,
    'Seven': false,
    'w': false,
    'Twdwo': false,
    'wd': false,
    'wd': false,
    'qa': false,
    'Sixqwf': false,
    'wd': false,
  };
  var holder_1 = [];
  getItems() {
    numbers.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }

  showdialogall(context, String mytitle, String mycontent) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(mytitle),
            content: Text(mycontent),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  //  final allowNotifications = NotificationSetting(title: 'all Notifications');

  // final notifications = [
  //   NotificationSetting(title: 'Analysis 1'),
  //   NotificationSetting(title: 'Analysis 2'),
  //   NotificationSetting(title: 'Analysis 3'),
  // ];
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("Know Your Analysis"),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: new Row(
                children: [
                  Container(
                    child: FlatButton(
                        onPressed: () => {}, child: Icon(Icons.search)),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    child: new TextField(
                      autocorrect: true,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                        labelText: 'Search',
                        hintText: 'enter your diseas ',
                        border: new OutlineInputBorder(
                            //borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Colors.white) //This is Ignored,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: numbers.keys.map((String key) {
                  return new CheckboxListTile(
                    title: new Text(key),
                    value: numbers[key],
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                    onChanged: (bool value) {
                      setState(() {
                        numbers[key] = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            RaisedButton(
              child: Text(
                " Submit ",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: showdialogall(context, "Result !", "CBC Test"),
              color: Colors.blue,
              textColor: Colors.white,
              splashColor: Colors.grey,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ],
        ),

        //      body: ListView(
        //         children: [
        //           buildToggleCheckbox(allowNotifications),
        //           Divider(),
        //           ...notifications.map(buildSingleCheckbox).toList(),
        //         ],
        //       ),
        //     );

        // Widget buildToggleCheckbox(NotificationSetting notification) => buildCheckbox(
        //     notification: notification,
        //     onClicked: () {
        //       final newValue = !notification.value;

        //       setState(() {
        //         allowNotifications.value = newValue;
        //         notifications.forEach((notification) {
        //           notification.value = newValue;
        //         });
        //       });
        //     });

        // Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
        //       notification: notification,
        //       onClicked: () {
        //         setState(() {
        //           final newValue = !notification.value;
        //           notification.value = newValue;

        //           if (!newValue) {
        //             allowNotifications.value = false;
        //           } else {
        //             final allow =
        //                 notifications.every((notification) => notification.value);
        //             allowNotifications.value = allow;
        //           }
        //         });
        //       },
        //     );

        // Widget buildCheckbox({
        //   @required NotificationSetting notification,
        //   @required VoidCallback onClicked,
        // }) =>
        //     ListTile(
        //       onTap: onClicked,
        //       leading: Checkbox(
        //         value: notification.value,
        //         onChanged: (value) => onClicked(),
        //       ),
        //       title: Text(
        //         notification.title,
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        // //     );

        //POPUP
        // body: Container(
        //   child: Center(
        //     child: MyButton(
        //       title: "Read Requirements",
        //       function: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => ReadReq()),
        //         );
        //       },
        //       mdw: mdw,
        //     ),
        //   ),
        // ),
        //Navigation
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
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
        ));
  }
}

// class NotificationSetting {
//   String title;
//   bool value;

//   NotificationSetting({
//     @required this.title,
//     this.value = false,
//   });
// }
