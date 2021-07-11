import 'package:flutter/material.dart';
class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2 - size / 18),
      child: Image(
        image: AssetImage('images/icons/medical.png'),
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
