import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget child;
  final Color titleColor;
  final List<Widget> actions;

  const BaseScreen({
    Key key,
    @required this.title,
    this.child,
    this.actions,
    this.titleColor,
  })  : assert(title != null, 'Title is required'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: actions,
      ),
      body: Center(
        child: SingleChildScrollView(child: child),
      ),
    );
  }
}
