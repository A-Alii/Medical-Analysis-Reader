
import 'package:flutter/cupertino.dart';

class Custom_Logo_Feedback extends StatelessWidget {
  const Custom_Logo_Feedback({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60),
      child: Container(
        height: MediaQuery.of(context).size.height*.2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('images/icons/medical.png'),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                'Your Feedback',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}