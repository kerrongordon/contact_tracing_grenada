import 'package:flutter/material.dart';

class CardComp extends StatelessWidget {
  final Color color;
  final Color shadowColor;
  final Widget child;
  final void Function() onTap;

  const CardComp({
    Key key,
    this.color,
    this.shadowColor,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      color: color,
      shadowColor: shadowColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        child: child,
        onTap: onTap,
      ),
    );
  }
}
