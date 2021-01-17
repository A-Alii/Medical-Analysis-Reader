import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _EditStates();
  }
}

class _EditStates extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Edit Your Profile"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20),
        child: new Column(
          children: [
            new TextField(
              keyboardType: TextInputType.name,
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Write Your Name",
                  labelText: "Your Name"),
            ),
            new TextField(
              keyboardType: TextInputType.emailAddress,
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Write Your Email",
                  labelText: "Email"),
            ),
            new TextField(
              keyboardType: TextInputType.visiblePassword,
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Write Your User Old Password",
                  labelText: "Old Password"),
            ),
            new TextField(
              keyboardType: TextInputType.visiblePassword,
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Write Your User New Password",
                  labelText: "New Password"),
            ),
            new TextField(
              keyboardType: TextInputType.visiblePassword,
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Confirm Your User Password",
                  labelText: "Confirm New Password"),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("Save"),
              color: Colors.lightBlue,
            )
          ],
        ),
      ),
    );
  }
}
