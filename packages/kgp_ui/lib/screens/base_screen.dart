import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget child;
  final Color titleColor;
  final Color backgroundColor;
  final Brightness brightness;
  final IconThemeData actionsIconTheme;
  final IconThemeData iconTheme;
  final List<Widget> actions;

  const BaseScreen({
    Key key,
    @required this.title,
    this.child,
    this.actions,
    this.titleColor,
    this.brightness,
    this.backgroundColor,
    this.actionsIconTheme,
    this.iconTheme,
  })  : assert(title != null, 'Title is required'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: backgroundColor,
        brightness: brightness,
        centerTitle: true,
        iconTheme: iconTheme,
        actions: actions,
      ),
      body: Center(
        child: SingleChildScrollView(child: child),
      ),
    );
  }
}
