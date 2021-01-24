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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
          title: Text("Know Your Analysis"),
          centerTitle: true,
        ),
        drawer: MyDrawer(),

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
        //     );
        body: Container(
          child: Center(
            child: MyButton(
              title: "Read Requirements",
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReadReq()),
                );
              },
              mdw: mdw,
            ),
          ),
        ),
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
