import 'package:flutter/material.dart';

class CardComp extends StatelessWidget {
  final Color color;
  final Color shadowColor;
  final Widget child;

  const CardComp({
    Key key,
    this.color,
    this.shadowColor,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      color: color,
      shadowColor: shadowColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
