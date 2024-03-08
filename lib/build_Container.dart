import 'package:flutter/material.dart';

class buildContainer extends StatelessWidget {
  buildContainer({required this.colour, this.cardchild, this.onpress});

  final Color? colour;
  final Widget? cardchild;
  final VoidCallback? onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
