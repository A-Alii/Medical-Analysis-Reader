
import 'package:flutter/cupertino.dart';

class Custom_Logo extends StatelessWidget {
  const Custom_Logo({
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
                'Scan Your Analysis',
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