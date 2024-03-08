import 'package:flutter/material.dart';
import 'constant.dart';

class bottombutton extends StatelessWidget {
  bottombutton({required this.onTap, required this.buttontitle});

  final VoidCallback onTap;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttontitle, style: kLargeButtonTextStyle),
        ),
        color: kbottomcontainercolor,
        margin: EdgeInsets.only(top: 10.0),
        height: kbottoncontainerheight,
      ),
    );
  }
}
